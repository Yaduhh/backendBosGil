const db = require('./../db');

exports.getMenu = (req, res) => {
  db.query('SELECT * FROM menu', (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results);
    }
  });
};
