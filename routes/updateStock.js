const express = require("express");
const router = express.Router();

router.post("/", (req, res) => {
  const orders = req.body.orders;

  console.log("Received orders for stock update:", orders);

  const menuIds = orders.map((order) => order.id);

  const getStockQuery = `SELECT id, name, stock FROM menu WHERE id IN (?)`;

  req.db.query(getStockQuery, [menuIds], (err, currentStock) => {
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

    const updatePromises = orders.map((order) => {
      return new Promise((resolve, reject) => {
        const updateQuery = `UPDATE menu SET stock = stock - ? WHERE id = ?`;
        req.db.query(updateQuery, [order.jumlah, order.id], (err, result) => {
          if (err) {
            reject(err);
          } else {
            resolve(result);
          }
        });
      });
    });

    Promise.all(updatePromises)
      .then(() => {
        res.json({ message: "Stock updated successfully" });
      })
      .catch((err) => {
        console.error("Error updating stock:", err);
        res.status(500).json({ error: err.message });
      });
  });
});

module.exports = router; 