const express = require("express");
const router = express.Router();
const db = require("../db");

router.get("/:id", (req, res) => {
  const id = req.params.id;
  const query = "SELECT * FROM menu WHERE id = ?";

  db.query(query, [id], (err, result) => {
    if (err) {
      return res.status(500).send("Error fetching menu item");
    }

    if (result.length === 0) {
      return res.status(404).json({ message: "Menu item not found" });
    }

    res.status(200).json(result[0]); // Mengembalikan menu item yang ditemukan
  });
});

module.exports = router;
