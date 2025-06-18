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

// Helper function to safely delete file
const safeDeleteFile = (filePath) => {
  try {
    if (fs.existsSync(filePath)) {
      fs.unlinkSync(filePath);
      console.log("Successfully deleted file:", filePath);
    }
  } catch (err) {
    console.log("Error in safeDeleteFile:", err);
  }
};

// Create storage configuration with dynamic destination
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const branch = getBranchFromHeader(req);
    const branchPath = path.join(__dirname, "..", "assets", branch);
    
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

// Edit product
router.put("/:id", upload.single("picture"), (req, res) => {
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
          const oldPicturePath = path.join(__dirname, "..", "assets", branch, currentProduct.picture);
          safeDeleteFile(oldPicturePath);
        }
      }

      updateSql += " WHERE id = ?";
      params.push(id);

      pool.query(updateSql, params, (err, result) => {
        if (err) {
          console.log(err);
          // If there's an error and new picture was uploaded, delete it
          if (picture) {
            const newPicturePath = path.join(__dirname, "..", "assets", branch, picture);
            safeDeleteFile(newPicturePath);
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

module.exports = router;
