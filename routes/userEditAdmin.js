const express = require("express");
const router = express.Router();
const db = require("../db");

router.put("/daftarAkun/:id", async (req, res) => {
  const { id } = req.params;
  const { name, username, role, gender } = req.body;
  try {
    const result = await db.query(
      "UPDATE users SET name = ?, username = ?, role = ?, gender = ? WHERE id = ?",
      [name, username, role, gender, id]
    );
    if (result.affectedRows > 0) {
      res.status(200).json({ message: "Akun berhasil diupdate" });
    } else {
      res.status(404).json({ message: "Akun tidak ditemukan" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Kesalahan server" });
  }
});

module.exports = router;
