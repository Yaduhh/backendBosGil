const express = require("express");
// Condet
const { notaReservasiCondet } = require("../controllers/nota/reservasi/notaReservasiCondet");
const { notaCondet } = require("../controllers/nota/pemesanan/notaCondet");
const { strukReservasiCondet } = require("../controllers/struk/reservasi/strukReservasiCondet");
const { strukPemesananCondet } = require("../controllers/struk/pemesanan/strukPemesananCondet");

// PUSAT
const { notaKarawaci } = require("../controllers/nota/pemesanan/notaKarawaci");
const { notaReservasiKarawaci } = require("../controllers/nota/reservasi/notaReservasiKarawaci");
const { strukReservasiKarawaci } = require("../controllers/struk/reservasi/strukReservasiKarawaci");
const { strukPemesananKarawaci} = require("../controllers/struk/pemesanan/strukPemesananKarawaci");

// BSD
const { notaBsd } = require("../controllers/nota/pemesanan/notaBsd");
const { notaReservasiBsd } = require("../controllers/nota/reservasi/notaReservasiBsd");
const { strukReservasiBsd } = require("../controllers/struk/reservasi/strukReservasiBsd");
const { strukPemesananBsd} = require("../controllers/struk/pemesanan/strukPemesananBsd");

// BandungKota
const { notaBandungKota } = require("../controllers/nota/pemesanan/notaBandungKota");
const { notaReservasiBandungKota } = require("../controllers/nota/reservasi/notaReservasiBandungKota");
const { strukReservasiBandungKota } = require("../controllers/struk/reservasi/strukResevasiBandungKota");
const { strukPemesananBandungKota} = require("../controllers/struk/pemesanan/strukPemesananBandungKota");

// BandungBuahBatu
const { notaBandungBuahBatu } = require("../controllers/nota/pemesanan/notaBandungBuahBatu");
const { notaReservasiBandungBuahBatu } = require("../controllers/nota/reservasi/notaReservasiBandungBuahBatu");
const { strukReservasiBandungBuahBatu } = require("../controllers/struk/reservasi/strukReservasiBandungBuahBatu");
const { strukPemesananBandungBuahBatu} = require("../controllers/struk/pemesanan/strukPemesananBandungBuahBatu");

// Sidoarjo
const { notaSidoarjo } = require("../controllers/nota/pemesanan/notaSidoarjo");
const { notaReservasiSidoarjo } = require("../controllers/nota/reservasi/notaReservasiSidoarjo");
const { strukReservasiSidoarjo } = require("../controllers/struk/reservasi/strukReservasiSidoarjo");
const { strukPemesananSidoarjo} = require("../controllers/struk/pemesanan/strukPemesananSidoarjo");

// Ampel
const { notaAmpel } = require("../controllers/nota/pemesanan/notaAmpel");
const { notaReservasiAmpel } = require("../controllers/nota/reservasi/notaReservasiAmpel");
const { strukReservasiAmpel } = require("../controllers/struk/reservasi/strukReservasiAmpel");
const { strukPemesananAmpel} = require("../controllers/struk/pemesanan/strukPemesananAmpel");

// Pagesangan
const { notaPagesangan } = require("../controllers/nota/pemesanan/notaPagesangan");
const { notaReservasiPagesangan } = require("../controllers/nota/reservasi/notaReservasiPagesangan");
const { strukReservasiPagesangan } = require("../controllers/struk/reservasi/strukReservasiPagesangan");
const { strukPemesananPagesangan} = require("../controllers/struk/pemesanan/strukPemesananPagesangan");


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
