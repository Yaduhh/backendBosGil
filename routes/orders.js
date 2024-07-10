// routes/orders.js
const express = require("express");
const router = express.Router();
const db = require("../db");

// GET all orders with cashier's name
router.get("/", (req, res) => {
  const query = `
    SELECT orders.*, users.name AS cashier_name
    FROM orders
    LEFT JOIN users ON orders.cashier = users.id
  `;

  db.query(query, (error, results) => {
    if (error) {
      console.error("Error fetching orders:", error);
      res.status(500).json({ error: "Failed to fetch orders" });
      return;
    }
    res.json(results);
  });
});

module.exports = router;
