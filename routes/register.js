const express = require("express");
const crypto = require("crypto");
const router = express.Router();
const db = require("../db");

router.post("/", (req, res) => {
  const { name, username, password, role, gender, birthday, status } = req.body;

  try {
    const hashedPassword = crypto
      .createHash("md5")
      .update(password)
      .digest("hex");

    const checkUserQuery = "SELECT * FROM users WHERE username = ?";
    db.query(checkUserQuery, [username], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).send("Internal server error");
      }

      if (result.length > 0) {
        return res
          .status(400)
          .json({ success: false, message: "Username sudah terdaftar" });
      }
      const currentDate = new Date();
      const sql =
        "INSERT INTO users (name, username, password, role, gender, birthday, createdAt, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
      db.query(
        sql,
        [
          name,
          username,
          hashedPassword,
          role,
          gender,
          birthday,
          currentDate,
          status,
        ],
        (err, result) => {
          if (err) {
            console.error(err);
            return res.status(500).send("Internal server error");
          }

          res.json({ success: true, message: "Registrasi berhasil" });
        }
      );
    });
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal server error");
  }
});

module.exports = router;
