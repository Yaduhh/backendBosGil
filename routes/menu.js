// routes/menu.js
const express = require('express');
const router = express.Router();

// GET all menu items
router.get('/', (req, res) => {
  // Memodifikasi query untuk mengurutkan berdasarkan ID secara menurun
  const query = 'SELECT * FROM menu ORDER BY id DESC';
  
  req.db.query(query, (error, results) => {
    if (error) {
      console.error('Error fetching menu:', error);
      res.status(500).json({ error: 'Failed to fetch menu items' });
      return;
    }
    res.json(results);
  });
});

module.exports = router;
