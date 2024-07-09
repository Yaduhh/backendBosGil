const express = require("express");
const router = express.Router();
const jwt = require("jsonwebtoken");
const db = require("../db");

const SECRET_KEY = "Nrp5kvfBiy1mjd8YZSxwQgajqbwukwFo";

router.post("/", (req, res) => {
  const { username, password } = req.body;

  const sql = "SELECT * FROM users WHERE username = ? AND password = ?";
  db.query(sql, [username, password], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send("Internal server error");
    }

    if (result.length > 0) {
      // Buat token JWT
      const token = jwt.sign({ username: username }, SECRET_KEY, {
        expiresIn: "1d",
      });
      res.json({ success: true, message: "Login berhasil", token: token });
    } else {
      res.json({ success: false, message: "Username atau password salah" });
    }
  });
});
module.exports = router;
