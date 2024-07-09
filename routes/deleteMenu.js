const express = require("express");
const router = express.Router();
const db = require("../db");
const fs = require("fs");
const path = require("path");

// Rute untuk menghapus item berdasarkan ID
router.delete("/:id", (req, res) => {
  const id = req.params.id;

  // Query untuk mendapatkan path gambar
  const getImageQuery = "SELECT picture FROM menu WHERE id = ?";
  db.query(getImageQuery, [id], (err, result) => {
    if (err) {
      console.error("Error fetching image path", err);
      return res.status(500).send("Error fetching image path");
    }

    if (result.length === 0) {
      return res.status(404).json({ error: "Menu item not found" });
    }

    const imagePath = path.join(
      __dirname,
      "../assets/images",
      result[0].picture
    );

    // Query untuk menghapus item dari database
    const deleteQuery = "DELETE FROM menu WHERE id = ?";
    db.query(deleteQuery, [id], (err, deleteResult) => {
      if (err) {
        console.error("Error deleting menu item", err);
        return res.status(500).send("Error deleting menu item");
      }

      // Hapus file gambar
      fs.unlink(imagePath, (err) => {
        if (err) {
          console.error("Error deleting image file", err);
          return res.status(500).send("Error deleting image file");
        }

        res
          .status(200)
          .json({ message: "Menu item and image deleted successfully" });
      });
    });
  });
});

module.exports = router;
