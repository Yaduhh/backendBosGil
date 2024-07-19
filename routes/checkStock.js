// routes/checkStock.js
const express = require("express");
const router = express.Router();
const db = require("../db");

router.post("/", (req, res) => {
  const orders = req.body.orders;

  console.log("Received orders for stock check:", orders);

  const menuIds = orders.map((order) => order.id);

  const getStockQuery = `SELECT id, name, stock FROM menu WHERE id IN (?)`;

  db.query(getStockQuery, [menuIds], (err, currentStock) => {
    if (err) {
      console.error("Error fetching current stock:", err);
      return res.status(500).json({ error: err.message });
    }
    const insufficientStock = orders.find((order) => {
      const stockItem = currentStock.find((stock) => stock.id === order.id);
      return !stockItem || order.jumlah > stockItem.stock;
    });

    if (insufficientStock) {
      const item = currentStock.find(
        (stock) => stock.id === insufficientStock.id
      );
      return res.status(400).json({
        error: `Stock ${item ? item.name : "Unknown"} Tidak Cukup`,
      });
    }

    res.json({ message: "Stock check successful" });
  });
});

module.exports = router;
