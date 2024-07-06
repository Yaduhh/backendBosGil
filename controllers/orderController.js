const db = require('../db');

exports.getOrders = (req, res) => {
  db.query('SELECT * FROM orders', (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results);
    }
  });
};

exports.updateOrder = (req, res) => {
  const { id } = req.params;
  const { pay, status, refund } = req.body;
  const query = 'UPDATE orders SET pay = ?, status = ?, refund = ? WHERE id = ?';

  db.query(query, [pay, status, refund, id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: 'Order updated successfully' });
    }
  });
};

exports.updateStatus = (req, res) => {
  const { id } = req.params;
  const { progress } = req.body;
  const query = 'UPDATE orders SET progress = ? WHERE id = ?';

  db.query(query, [progress, id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: 'Order updated successfully' });
    }
  });
};
