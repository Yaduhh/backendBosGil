const express = require("express");
const router = express.Router();
const db = require("../db");

router.post("/", (req, res) => {
  const { username, password } = req.body;

  const sql = "SELECT * FROM users WHERE username = ? AND password = ?";
  db.query(sql, [username, password], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send("Internal server error");
    }

    if (result.length > 0) {
      res.json({ success: true, message: "Login berhasil" });
    } else {
      res.json({ success: false, message: "Username atau password salah" });
    }
  });
});

module.exports = router;
