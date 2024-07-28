const express = require("express");
const router = express.Router();
const jwt = require("jsonwebtoken");
const db = require("../db");
const md5 = require("md5");

const SECRET_KEY = "Nrp5kvfBiy1mjd8YZSxwQgajqbwukwFo";

router.post("/", (req, res) => {
  const { username, password } = req.body;
  const md5Password = md5(password);

  const sql = "SELECT * FROM users WHERE username = ? AND password = ?";
  db.query(sql, [username, md5Password], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send("Internal server error");
    }

    if (result.length > 0) {
      const user = result[0];
      const { username, name, role, id } = user;
      const token = jwt.sign(
        { username: username, name: name, role: role, id: id },
        SECRET_KEY,
        {
          expiresIn: "1d",
        }
      );
      res.json({
        success: true,
        message: "Login berhasil",
        token: token,
        name: name,
        username: username,
        role: role,
        id: id,
      });
    } else {
      res.json({ success: false, message: "Username atau password salah" });
    }
  });
});
module.exports = router;
