// server.js
const express = require('express');
const axios = require('axios');
const cors = require('cors');
const db = require('./db');

const app = express();
const port = 3000; 
const ordersRouter = require('./routes/orders');
const { updateOrder } = require('./controllers/orderController');

app.use(express.json());

const corsOptions = {
   origin: 'http://192.168.1.10:8081', // Sesuaikan ini dengan alamat IP dan port React Native Anda
   methods: ['GET', 'POST'],
   allowedHeaders: ['Content-Type'],
};

// Routes
app.post('/orders', (req, res) => {
    const { nama, pesanan, price, normalprice } = req.body;
  
    // Validasi bahwa 'nama' tidak boleh kosong
    if (!nama || nama.trim() === '') {
      return res.status(400).send('Nama pelanggan harus diisi');
    }

    const now = new Date();
    const formattedDate = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')} ${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}:${String(now.getSeconds()).padStart(2, '0')}`;
  
    // Lanjutkan dengan penyimpanan ke database jika valid
    const status = false;
    const refund = 0;
    const progress = false;
  
    const sql = 'INSERT INTO orders (name, pesanan, normalprice, price, status, refund, progress, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    db.query(sql, [nama, JSON.stringify(pesanan), normalprice, price, status, refund, progress, formattedDate], (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send('Error saving to database');
      }
      res.status(200).send('Order saved to database');
    });
});

// Gunakan router orders untuk semua permintaan ke /orders
app.use('/getorders', ordersRouter);
app.post('/orders/:id/refund', updateOrder);

app.use(cors(corsOptions));
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
