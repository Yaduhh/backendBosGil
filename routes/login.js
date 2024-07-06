const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 3000;

// Middleware untuk parsing body dari request
app.use(bodyParser.json());

// Konfigurasi koneksi ke database MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', // Ganti dengan username MySQL Anda
  password: '', // Ganti dengan password MySQL Anda
  database: 'bosgil', // Ganti dengan nama database Anda
});

// Koneksi ke database
db.connect(err => {
  if (err) {
    throw err;
  }
  console.log('Connected to database');
});

// Endpoint untuk login
app.post('/users', (req, res) => {
  const { username, password } = req.body;
  const sql = `SELECT * FROM users WHERE username = ? AND password = ?`;
  db.query(sql, [username, password], (err, result) => {
    if (err) {
      res.status(500).json({ success: false, message: 'Internal server error' });
    } else {
      if (result.length > 0) {
        res.status(200).json({ success: true, message: 'Login successful' });
      } else {
        res.status(401).json({ success: false, message: 'Username or password is incorrect' });
      }
    }
  });
});

// Endpoint untuk halaman beranda
app.get('./HomeScreen', (req, res) => {
  res.status(200).send('Welcome to Home Page');
});

// Jalankan server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
