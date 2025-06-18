exports.getMenu = (req, res) => {
  console.log('=== Menu Query ===');
  console.log('Branch:', req.branch);
  console.log('Database:', req.db.config.database);
  
  req.db.query('SELECT * FROM menu', (err, results) => {
    if (err) {
      console.error('Menu query error:', err);
      res.status(500).json({ error: err.message });
    } else {
      console.log('Query results count:', results.length);
      console.log('==================');
      res.json(results);
    }
  });
};
