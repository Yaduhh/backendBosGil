// routes/orders.js
const express = require("express");
const router = express.Router();
const db = require("../db");
const path = require("path");
const multer = require("multer");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "assets/images");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const upload = multer({ storage: storage });

router.post("/", upload.single("picture"), (req, res) => {
  const { name, typemenu, type, status, detail, price, stock } = req.body;
  const picture = req.file ? req.file.filename : null;
  if (!name || !typemenu || !type || !status || !detail || !price || !stock) {
    return res.status(400).send("Semua field harus diisi");
  }

  // Cek apakah nama menu sudah ada di database
  const checkSql = "SELECT * FROM menu WHERE name = ?";
  db.query(checkSql, [name], (err, result) => {
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
    db.query(
      insertSql,
      [name, typemenu, type, status, detail, picture, price, stock],
      (err, result) => {
        if (err) {
          console.log(err);
          return res.status(500).send("Error saving to database");
        }
        res
          .status(200)
          .json({ success: true, message: "Product saved to database" });
      }
    );
  });
});
module.exports = router;
