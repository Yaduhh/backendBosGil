// routes/reduceStock.js
const express = require("express");
const router = express.Router();
const db = require("../db"); // Sesuaikan path jika perlu

router.post("/", (req, res) => {
  const orders = req.body.orders;

  console.log("Received orders for stock reduction:", orders);

  const getStockQuery = `SELECT id, stock FROM menu WHERE id IN (?)`;
  const menuIds = orders.map((order) => order.id);

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
      return res.status(400).json({
        error: `Not enough stock for menu ID: ${insufficientStock.id}`,
      });
    }

    let queries = orders.map((order) => {
      return new Promise((resolve, reject) => {
        const query = `UPDATE menu SET stock = stock - ? WHERE id = ?`;
        db.query(query, [order.jumlah, order.id], (err, result) => {
          if (err) {
            console.error("Error updating stock:", err);
            reject(err);
          } else {
            console.log(
              `Stock updated for menu ID: ${order.id}, Quantity reduced: ${order.jumlah}`
            );
            resolve(result);
          }
        });
      });
    });

    Promise.all(queries)
      .then(() => {
        res.json({ message: "Stock updated successfully" });
      })
      .catch((err) => {
        res.status(500).json({ error: err.message });
      });
  });
});

module.exports = router;
