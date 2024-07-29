const express = require("express");
const router = express.Router();
const db = require("../db");

// Endpoint untuk menghapus akun
router.delete("/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const result = await db.query("DELETE FROM users WHERE id = ?", [id]);
    if (result.affectedRows > 0) {
      console.log(`Akun dengan id ${id} berhasil dihapus`);
      res.status(200).json({ message: "Akun berhasil dihapus" });
    } else {
      console.log(`Akun dengan id ${id} tidak ditemukan`);
      res.status(404).json({ message: "Akun tidak ditemukan" });
    }
  } catch (error) {
    console.error(`Kesalahan saat menghapus akun dengan id ${id}:`, error);
    res.status(500).json({ message: "Kesalahan server" });
  }
});

module.exports = router;
