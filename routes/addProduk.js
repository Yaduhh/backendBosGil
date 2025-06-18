// routes/orders.js
const express = require("express");
const router = express.Router();
const { getPool } = require("../db");
const path = require("path");
const multer = require("multer");
const fs = require("fs");

// Get branch from request header
const getBranchFromHeader = (req) => {
  const branch = req.headers["x-branch-id"] || "condet";
  return branch.toLowerCase();
};

// Create storage configuration with dynamic destination
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const branch = getBranchFromHeader(req);
    const branchPath = path.join("assets", branch);
    
    // Create branch directory if it doesn't exist
    if (!fs.existsSync(branchPath)) {
      fs.mkdirSync(branchPath, { recursive: true });
    }
    
    cb(null, branchPath);
  },
  filename: function (req, file, cb) {
    // Generate unique filename with original extension
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const ext = path.extname(file.originalname);
    cb(null, uniqueSuffix + ext);
  },
});

const upload = multer({ 
  storage: storage,
  fileFilter: (req, file, cb) => {
    // Accept only image files
    if (file.mimetype.startsWith('image/')) {
      cb(null, true);
    } else {
      cb(new Error('Only image files are allowed!'), false);
    }
  },
  limits: {
    fileSize: 5 * 1024 * 1024 // 5MB limit
  }
});

// Add new product
router.post("/", upload.single("picture"), (req, res) => {
  const { name, typemenu, type, status, detail, price, stock } = req.body;
  const picture = req.file ? req.file.filename : null;
  const branch = getBranchFromHeader(req);

  if (!name || !typemenu || !type || !status || !detail || !price || !stock) {
    return res.status(400).send("Semua field harus diisi");
  }

  // Get the appropriate database pool for the branch
  const pool = getPool(branch);

  // Cek apakah nama menu sudah ada di database
  const checkSql = "SELECT * FROM menu WHERE name = ?";
  pool.query(checkSql, [name], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send("Error checking database");
    }

    if (result.length > 0) {
      return res.status(400).send("Nama menu tersebut sudah ada!");
    }

    // Jika tidak ada, lanjutkan untuk menyimpan menu ke database
    const insertSql =
      "INSERT INTO menu (name, typemenu, type, status, detail, picture, price, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    pool.query(
      insertSql,
      [name, typemenu, type, status, detail, picture, price, stock],
      (err, result) => {
        if (err) {
          console.log(err);
          // If there's an error, delete the uploaded file
          if (picture) {
            const filePath = path.join("assets", branch, picture);
            fs.unlink(filePath, (unlinkErr) => {
              if (unlinkErr) console.log("Error deleting file:", unlinkErr);
            });
          }
          return res.status(500).send("Error saving to database");
        }
        res.status(200).json({ 
          success: true, 
          message: "Product saved to database",
          data: {
            id: result.insertId,
            name,
            typemenu,
            type,
            status,
            detail,
            picture,
            price,
            stock,
            branch
          }
        });
      }
    );
  });
});

// Edit product
router.put("/edit/:id", upload.single("picture"), (req, res) => {
  const { id } = req.params;
  const { name, typemenu, type, status, detail, price, stock } = req.body;
  const picture = req.file ? req.file.filename : null;
  const branch = getBranchFromHeader(req);

  if (!name || !typemenu || !type || !status || !detail || !price || !stock) {
    return res.status(400).send("Semua field harus diisi");
  }

  const pool = getPool(branch);

  // First get the current product to check if name is changed and to get old picture
  pool.query("SELECT * FROM menu WHERE id = ?", [id], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send("Error checking product");
    }

    if (result.length === 0) {
      return res.status(404).send("Product not found");
    }

    const currentProduct = result[0];

    // If name is changed, check if new name already exists
    if (name !== currentProduct.name) {
      pool.query("SELECT * FROM menu WHERE name = ? AND id != ?", [name, id], (err, result) => {
        if (err) {
          console.log(err);
          return res.status(500).send("Error checking name");
        }

        if (result.length > 0) {
          return res.status(400).send("Nama menu tersebut sudah ada!");
        }

        updateProduct();
      });
    } else {
      updateProduct();
    }

    function updateProduct() {
      let updateSql = "UPDATE menu SET name = ?, typemenu = ?, type = ?, status = ?, detail = ?, price = ?, stock = ?";
      let params = [name, typemenu, type, status, detail, price, stock];

      // If new picture is uploaded, add it to update
      if (picture) {
        updateSql += ", picture = ?";
        params.push(picture);

        // Delete old picture
        if (currentProduct.picture) {
          const oldPicturePath = path.join("assets", branch, currentProduct.picture);
          fs.unlink(oldPicturePath, (err) => {
            if (err) console.log("Error deleting old picture:", err);
          });
        }
      }

      updateSql += " WHERE id = ?";
      params.push(id);

      pool.query(updateSql, params, (err, result) => {
        if (err) {
          console.log(err);
          // If there's an error and new picture was uploaded, delete it
          if (picture) {
            const newPicturePath = path.join("assets", branch, picture);
            fs.unlink(newPicturePath, (unlinkErr) => {
              if (unlinkErr) console.log("Error deleting new picture:", unlinkErr);
            });
          }
          return res.status(500).send("Error updating product");
        }

        res.status(200).json({
          success: true,
          message: "Product updated successfully",
          data: {
            id,
            name,
            typemenu,
            type,
            status,
            detail,
            picture: picture || currentProduct.picture,
            price,
            stock,
            branch
          }
        });
      });
    }
  });
});

// Delete product
router.delete("/delete/:id", (req, res) => {
  const { id } = req.params;
  const branch = getBranchFromHeader(req);
  const pool = getPool(branch);

  // First get the product to get the picture filename
  pool.query("SELECT * FROM menu WHERE id = ?", [id], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send("Error checking product");
    }

    if (result.length === 0) {
      return res.status(404).send("Product not found");
    }

    const product = result[0];

    // Delete the product
    pool.query("DELETE FROM menu WHERE id = ?", [id], (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("Error deleting product");
      }

      // Delete the product picture if it exists
      if (product.picture) {
        const picturePath = path.join("assets", branch, product.picture);
        fs.unlink(picturePath, (err) => {
          if (err) console.log("Error deleting picture:", err);
        });
      }

      res.status(200).json({
        success: true,
        message: "Product deleted successfully"
      });
    });
  });
});

module.exports = router;
