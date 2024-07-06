// routes/orders.js
const express = require('express');
const router = express.Router();
const db = require('../db');

// GET all orders
router.get('/', (req, res) => {
  const query = 'SELECT * FROM orders';
  db.query(query, (error, results) => {
    if (error) {
      console.error('Error fetching orders:', error);
      res.status(500).json({ error: 'Failed to fetch orders' });
      return;
    }
    res.json(results);
  });
});

module.exports = router;
