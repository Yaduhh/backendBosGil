// routes/reservasi.js
const express = require("express");
const router = express.Router();

// GET all orders with cashier's name where progress is not equal to 2 and status_reservasi is 0
router.get("/", (req, res) => {
  const query = `
    SELECT orders.*, users.name AS cashier_name
    FROM orders
    LEFT JOIN users ON orders.cashier = users.id
    WHERE orders.progress != 2 AND orders.status_reservasi = 0
    ORDER BY orders.orderanBuat DESC
  `;

  req.db.query(query, (error, results) => {
    if (error) {
      console.error("Error fetching reservations:", error);
      return res.status(500).json({ 
        success: false,
        error: "Gagal mengambil data reservasi" 
      });
    }
    res.json({
      success: true,
      data: results
    });
  });
});

// GET reservation by ID
router.get("/:id", (req, res) => {
  const { id } = req.params;
  const query = `
    SELECT orders.*, users.name AS cashier_name
    FROM orders
    LEFT JOIN users ON orders.cashier = users.id
    WHERE orders.id = ? AND orders.status_reservasi = 0
  `;

  req.db.query(query, [id], (error, results) => {
    if (error) {
      console.error("Error fetching reservation:", error);
      return res.status(500).json({ 
        success: false,
        error: "Gagal mengambil detail reservasi" 
      });
    }

    if (results.length === 0) {
      return res.status(404).json({ 
        success: false,
        error: "Reservasi tidak ditemukan" 
      });
    }

    res.json({
      success: true,
      data: results[0]
    });
  });
});

// GET reservations by date range
router.get("/date-range", (req, res) => {
  const { startDate, endDate } = req.query;
  
  if (!startDate || !endDate) {
    return res.status(400).json({
      success: false,
      error: "Tanggal awal dan akhir harus diisi"
    });
  }

  const query = `
    SELECT orders.*, users.name AS cashier_name
    FROM orders
    LEFT JOIN users ON orders.cashier = users.id
    WHERE orders.status_reservasi = 0 
    AND DATE(orders.orderanBuat) BETWEEN ? AND ?
    ORDER BY orders.orderanBuat DESC
  `;

  req.db.query(query, [startDate, endDate], (error, results) => {
    if (error) {
      console.error("Error fetching reservations by date:", error);
      return res.status(500).json({ 
        success: false,
        error: "Gagal mengambil data reservasi" 
      });
    }
    res.json({
      success: true,
      data: results
    });
  });
});

module.exports = router;
