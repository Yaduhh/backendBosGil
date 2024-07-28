// routes/orders.js
const express = require("express");
const router = express.Router();
const db = require("../db");

// GET all orders
router.get("/", (req, res) => {
  const query = "SELECT * FROM users";
  db.query(query, (error, results) => {
    if (error) {
      console.error("Error fetching users:", error);
      res.status(500).json({ error: "Failed to fetch users" });
      return;
    }
    res.json(results);
  });
});

module.exports = router;
