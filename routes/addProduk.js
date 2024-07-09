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
  const { name, typemenu, type, status, detail, price } = req.body;
  const picture = req.file ? req.file.filename : null;

  if (!name || !typemenu || !type || !status || !detail || !price) {
    return res.status(400).send("Semua field harus diisi");
  }

  const sql =
    "INSERT INTO menu (name, typemenu, type, status, detail, picture, price) VALUES (?, ?, ?, ?, ?, ?, ?)";
  db.query(
    sql,
    [name, typemenu, type, status, detail, picture, price],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("Error saving to database");
      }
      res.status(200).send("Product saved to database");
    }
  );
});

module.exports = router;
