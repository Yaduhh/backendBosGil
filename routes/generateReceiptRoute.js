const express = require("express");
const { notaReservasiCondet } = require("../controllers/nota/reservasi/NotaReservasiCondet");
const { notaCondet } = require("../controllers/nota/pemesanan/notaCondet");
const { strukReservasiCondet } = require("../controllers/struk/reservasi/strukReservasiCondet");
const { strukPemesananCondet } = require("../controllers/struk/pemesanan/strukPemesananCondet");

const router = express.Router();
// Define the route for generating receipt
router.post("/generate-reservasi", async (req, res) => {
  const { order } = req.body;

  try {
    let htmlReceipt;
    if (order.status === 2) {
      htmlReceipt = await strukReservasiCondet(order);
    } else {
      htmlReceipt = await notaReservasiCondet(order);
    }

    res.json({ success: true, htmlReceipt });
  } catch (error) {
    res.status(500).json({ success: false, message: 'Gagal menghasilkan struk' });
  }
});

router.post("/generate-pemesanan", async (req, res) => {
  const { order } = req.body;

  try {
    let htmlReceipt;
    if (order.status === 2) {
      htmlReceipt = await strukPemesananCondet(order);
    } else {
      htmlReceipt = await notaCondet(order);
    }

    res.json({ success: true, htmlReceipt });
  } catch (error) {
    res.status(500).json({ success: false, message: 'Gagal menghasilkan struk' });
  }
});

module.exports = router;
