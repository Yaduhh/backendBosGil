const db = require("../db");
const multer = require("multer");
const path = require("path");
const fs = require("fs");

exports.getOrders = (req, res) => {
  db.query("SELECT * FROM orders", (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results);
    }
  });
};

const getOrderNameMiddleware = (req, res, next) => {
  const { id } = req.params;
  const query = "SELECT name FROM orders WHERE id = ?";

  db.query(query, [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    req.orderName = results[0].name.replace(/\s+/g, "_"); // Ganti spasi dengan underscore
    next();
  });
};

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads");
  },
  filename: (req, file, cb) => {
    const orderName = req.orderName || Date.now(); // Gunakan nama order atau timestamp sebagai fallback
    const now = new Date();
    const formattedDate = `${now.getFullYear()}-${String(
      now.getMonth() + 1
    ).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}_${String(
      now.getHours()
    ).padStart(2, "0")}-${String(now.getMinutes()).padStart(2, "0")}-${String(
      now.getSeconds()
    ).padStart(2, "0")}`;
    const filename = `${orderName}_${formattedDate}${path.extname(
      file.originalname
    )}`;
    cb(null, filename);
  },
});

const upload = multer({ storage: storage });
exports.uploadOrderImage = upload.single("image");

exports.updateOrder = (req, res) => {
  const { id } = req.params;
  const { pay, status, refund } = req.body;
  const image = req.file ? req.file.filename : null;
  console.log("Received file:", req.file);
  const query =
    "UPDATE orders SET pay = ?, status = ?, refund = ?, image = ? WHERE id = ?";

  db.query(query, [pay, status, refund, image, id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: "Order updated successfully" });
    }
  });
};

exports.updateStatus = (req, res) => {
  const { id } = req.params;
  const { progress } = req.body;
  const query = "UPDATE orders SET progress = ? WHERE id = ?";

  db.query(query, [progress, id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: "Order updated successfully" });
    }
  });
};

exports.deleteOrder = (req, res) => {
  const { id } = req.params;
  const { parsedPesanan } = req.body; // Ambil parsedPesanan dari body request

  // Dapatkan nama file gambar yang terkait dengan order
  const queryGetImage = "SELECT image FROM orders WHERE id = ?";

  db.query(queryGetImage, [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    const imageName = results[0].image;

    // Hapus order dari database
    const queryDeleteOrder = "DELETE FROM orders WHERE id = ?";

    db.query(queryDeleteOrder, [id], (err, result) => {
      if (err) {
        return res.status(500).json({ error: err.message });
      }

      // Jika ada gambar, hapus dari filesystem
      if (imageName) {
        const imagePath = path.join(__dirname, "..", "uploads", imageName);

        fs.unlink(imagePath, (err) => {
          if (err) {
            console.error("Failed to delete image file:", err);
          }
        });
      }

      // Update stok menu berdasarkan parsedPesanan
      if (parsedPesanan) {
        parsedPesanan.forEach((item) => {
          const queryUpdateStock =
            "UPDATE menu SET stock = stock + ? WHERE name = ?";
          db.query(queryUpdateStock, [item.jumlah, item.menu], (err) => {
            if (err) {
              console.error("Failed to update menu stock:", err);
            }
          });
        });
      }

      res.json({ message: "Order deleted successfully" });
    });
  });
};

exports.getOrderNameMiddleware = getOrderNameMiddleware;
