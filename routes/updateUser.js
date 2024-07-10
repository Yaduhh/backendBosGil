const express = require("express");
const router = express.Router();
const db = require("../db");
const md5 = require("md5");

router.post("/updateUser", (req, res) => {
  const { id, name, username, password } = req.body;

  let sql = "UPDATE users SET name = ?, username = ?";
  let params = [name, username];

  // Only add password update if new password is provided
  if (password) {
    sql += ", password = ?";
    params.push(md5(password));
  }

  sql += " WHERE id = ?";
  params.push(id);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error("Error updating user:", err);
      return res.status(500).json({
        success: false,
        message: "Terjadi kesalahan saat memperbarui data",
      });
    }

    if (result.affectedRows > 0) {
      res.json({
        success: true,
        message: "Data user berhasil diperbarui",
      });
    } else {
      res.json({
        success: false,
        message: "User dengan ID yang diberikan tidak ditemukan",
      });
    }
  });
});

module.exports = router;
