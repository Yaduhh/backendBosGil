const express = require("express");

// Image controllers - Nota Pemesanan
const { notaCondetImage } = require("../controllers/image/nota/pemesanan/notaCondetImage");
const { notaKarawaciImage } = require("../controllers/image/nota/pemesanan/notaKarawaciImage");
const { notaBsdImage } = require("../controllers/image/nota/pemesanan/notaBsdImage");
const { notaBandungKotaImage } = require("../controllers/image/nota/pemesanan/notaBandungKotaImage");
const { notaBandungBuahBatuImage } = require("../controllers/image/nota/pemesanan/notaBandungBuahBatuImage");
const { notaSidoarjoImage } = require("../controllers/image/nota/pemesanan/notaSidoarjoImage");
const { notaAmpelImage } = require("../controllers/image/nota/pemesanan/notaAmpelImage");
const { notaPagesanganImage } = require("../controllers/image/nota/pemesanan/notaPagesanganImage");
const { notaBintaroImage } = require("../controllers/image/nota/pemesanan/notaBintaroImage");

// Image controllers - Struk Pemesanan
const { strukPemesananCondetImage } = require("../controllers/image/struk/pemesanan/strukPemesananCondetImage");
const { strukPemesananKarawaciImage } = require("../controllers/image/struk/pemesanan/strukPemesananKarawaciImage");
const { strukPemesananBsdImage } = require("../controllers/image/struk/pemesanan/strukPemesananBsdImage");
const { strukPemesananBandungKotaImage } = require("../controllers/image/struk/pemesanan/strukPemesananBandungKotaImage");
const { strukPemesananBandungBuahBatuImage } = require("../controllers/image/struk/pemesanan/strukPemesananBandungBuahBatuImage");
const { strukPemesananSidoarjoImage } = require("../controllers/image/struk/pemesanan/strukPemesananSidoarjoImage");
const { strukPemesananAmpelImage } = require("../controllers/image/struk/pemesanan/strukPemesananAmpelImage");
const { strukPemesananPagesanganImage } = require("../controllers/image/struk/pemesanan/strukPemesananPagesanganImage");
const { strukPemesananBintaroImage } = require("../controllers/image/struk/pemesanan/strukPemesananBintaroImage");

// Image controllers - Nota Reservasi
const { notaReservasiCondetImage } = require("../controllers/image/nota/reservasi/notaReservasiCondetImage");
const { notaReservasiKarawaciImage } = require("../controllers/image/nota/reservasi/notaReservasiKarawaciImage");
const { notaReservasiBsdImage } = require("../controllers/image/nota/reservasi/notaReservasiBsdImage");
const { notaReservasiBandungKotaImage } = require("../controllers/image/nota/reservasi/notaReservasiBandungKotaImage");
const { notaReservasiBandungBuahBatuImage } = require("../controllers/image/nota/reservasi/notaReservasiBandungBuahBatuImage");
const { notaReservasiSidoarjoImage } = require("../controllers/image/nota/reservasi/notaReservasiSidoarjoImage");
const { notaReservasiAmpelImage } = require("../controllers/image/nota/reservasi/notaReservasiAmpelImage");
const { notaReservasiPagesanganImage } = require("../controllers/image/nota/reservasi/notaReservasiPagesanganImage");
const { notaReservasiBintaroImage } = require("../controllers/image/nota/reservasi/notaReservasiBintaroImage");

// Image controllers - Struk Reservasi
const { strukReservasiCondetImage } = require("../controllers/image/struk/reservasi/strukReservasiCondetImage");
const { strukReservasiKarawaciImage } = require("../controllers/image/struk/reservasi/strukReservasiKarawaciImage");
const { strukReservasiBsdImage } = require("../controllers/image/struk/reservasi/strukReservasiBsdImage");
const { strukReservasiBandungKotaImage } = require("../controllers/image/struk/reservasi/strukReservasiBandungKotaImage");
const { strukReservasiBandungBuahBatuImage } = require("../controllers/image/struk/reservasi/strukReservasiBandungBuahBatuImage");
const { strukReservasiSidoarjoImage } = require("../controllers/image/struk/reservasi/strukReservasiSidoarjoImage");
const { strukReservasiAmpelImage } = require("../controllers/image/struk/reservasi/strukReservasiAmpelImage");
const { strukReservasiPagesanganImage } = require("../controllers/image/struk/reservasi/strukReservasiPagesanganImage");
const { strukReservasiBintaroImage } = require("../controllers/image/struk/reservasi/strukReservasiBintaroImage");
// Condet
const {
  notaReservasiCondet,
} = require("../controllers/nota/reservasi/notaReservasiCondet");
const { notaCondet } = require("../controllers/nota/pemesanan/notaCondet");
const {
  strukReservasiCondet,
} = require("../controllers/struk/reservasi/strukReservasiCondet");
const {
  strukPemesananCondet,
} = require("../controllers/struk/pemesanan/strukPemesananCondet");

// PUSAT
const { notaKarawaci } = require("../controllers/nota/pemesanan/notaKarawaci");
const {
  notaReservasiKarawaci,
} = require("../controllers/nota/reservasi/notaReservasiKarawaci");
const {
  strukReservasiKarawaci,
} = require("../controllers/struk/reservasi/strukReservasiKarawaci");
const {
  strukPemesananKarawaci,
} = require("../controllers/struk/pemesanan/strukPemesananKarawaci");

// BSD
const { notaBsd } = require("../controllers/nota/pemesanan/notaBsd");
const {
  notaReservasiBsd,
} = require("../controllers/nota/reservasi/notaReservasiBsd");
const {
  strukReservasiBsd,
} = require("../controllers/struk/reservasi/strukReservasiBsd");
const {
  strukPemesananBsd,
} = require("../controllers/struk/pemesanan/strukPemesananBsd");

// BandungKota
const {
  notaBandungKota,
} = require("../controllers/nota/pemesanan/notaBandungKota");
const {
  notaReservasiBandungKota,
} = require("../controllers/nota/reservasi/notaReservasiBandungKota");
const {
  strukReservasiBandungKota,
} = require("../controllers/struk/reservasi/strukResevasiBandungKota");
const {
  strukPemesananBandungKota,
} = require("../controllers/struk/pemesanan/strukPemesananBandungKota");

// BandungBuahBatu
const {
  notaBandungBuahBatu,
} = require("../controllers/nota/pemesanan/notaBandungBuahBatu");
const {
  notaReservasiBandungBuahBatu,
} = require("../controllers/nota/reservasi/notaReservasiBandungBuahBatu");
const {
  strukReservasiBandungBuahBatu,
} = require("../controllers/struk/reservasi/strukReservasiBandungBuahBatu");
const {
  strukPemesananBandungBuahBatu,
} = require("../controllers/struk/pemesanan/strukPemesananBandungBuahBatu");

// Sidoarjo
const { notaSidoarjo } = require("../controllers/nota/pemesanan/notaSidoarjo");
const {
  notaReservasiSidoarjo,
} = require("../controllers/nota/reservasi/notaReservasiSidoarjo");
const {
  strukReservasiSidoarjo,
} = require("../controllers/struk/reservasi/strukReservasiSidoarjo");
const {
  strukPemesananSidoarjo,
} = require("../controllers/struk/pemesanan/strukPemesananSidoarjo");

// Ampel
const { notaAmpel } = require("../controllers/nota/pemesanan/notaAmpel");
const {
  notaReservasiAmpel,
} = require("../controllers/nota/reservasi/notaReservasiAmpel");
const {
  strukReservasiAmpel,
} = require("../controllers/struk/reservasi/strukReservasiAmpel");
const {
  strukPemesananAmpel,
} = require("../controllers/struk/pemesanan/strukPemesananAmpel");

// Pagesangan
const {
  notaPagesangan,
} = require("../controllers/nota/pemesanan/notaPagesangan");
const {
  notaReservasiPagesangan,
} = require("../controllers/nota/reservasi/notaReservasiPagesangan");
const {
  strukReservasiPagesangan,
} = require("../controllers/struk/reservasi/strukReservasiPagesangan");
const {
  strukPemesananPagesangan,
} = require("../controllers/struk/pemesanan/strukPemesananPagesangan");

// Bintaro
const { notaBintaro } = require("../controllers/nota/pemesanan/notaBintaro");
const {
  notaReservasiBintaro,
} = require("../controllers/nota/reservasi/notaReservasiBintaro");
const {
  strukReservasiBintaro,
} = require("../controllers/struk/reservasi/strukReservasiBintaro");
const {
  strukPemesananBintaro,
} = require("../controllers/struk/pemesanan/strukPemesananBintaro");

const router = express.Router();
// Utility to get branch from header
const getBranchFromHeader = (req) => {
  const branch = req.headers["x-branch-id"] || "condet";
  return branch.toLowerCase();
};

// Mapping for each branch to its respective nota/struk functions
const notaReservasiMap = {
  condet: notaReservasiCondet,
  karawaci: notaReservasiKarawaci,
  bsd: notaReservasiBsd,
  bsdwaiters: notaReservasiBsd,
  bandungkota: notaReservasiBandungKota,
  bandungbuahbatu: notaReservasiBandungBuahBatu,
  pagesangan: notaReservasiPagesangan,
  ampel: notaReservasiAmpel,
  sidoarjo: notaReservasiSidoarjo,
  bintaro: notaReservasiBintaro,
  bintarowaiters: notaReservasiBintaro,
};
const strukReservasiMap = {
  condet: strukReservasiCondet,
  karawaci: strukReservasiKarawaci,
  bsd: strukReservasiBsd,
  bsdwaiters: strukReservasiBsd,
  bandungkota: strukReservasiBandungKota,
  bandungbuahbatu: strukReservasiBandungBuahBatu,
  pagesangan: strukReservasiPagesangan,
  ampel: strukReservasiAmpel,
  sidoarjo: strukReservasiSidoarjo,
  bintaro: strukReservasiBintaro,
  bintarowaiters: strukReservasiBintaro,
};
const notaPemesananMap = {
  condet: notaCondet,
  karawaci: notaKarawaci,
  bsd: notaBsd,
  bsdwaiters: notaBsd,
  bandungkota: notaBandungKota,
  bandungbuahbatu: notaBandungBuahBatu,
  pagesangan: notaPagesangan,
  ampel: notaAmpel,
  sidoarjo: notaSidoarjo,
  bintaro: notaBintaro,
  bintarowaiters: notaBintaro,
};
const strukPemesananMap = {
  condet: strukPemesananCondet,
  karawaci: strukPemesananKarawaci,
  bsd: strukPemesananBsd,
  bsdwaiters: strukPemesananBsd,
  bandungkota: strukPemesananBandungKota,
  bandungbuahbatu: strukPemesananBandungBuahBatu,
  pagesangan: strukPemesananPagesangan,
  ampel: strukPemesananAmpel,
  sidoarjo: strukPemesananSidoarjo,
  bintaro: strukPemesananBintaro,
  bintarowaiters: strukPemesananBintaro,
};

// Mapping for image controllers
const notaReservasiImageMap = {
  condet: notaReservasiCondetImage,
  karawaci: notaReservasiKarawaciImage,
  bsd: notaReservasiBsdImage,
  bsdwaiters: notaReservasiBsdImage,
  bandungkota: notaReservasiBandungKotaImage,
  bandungbuahbatu: notaReservasiBandungBuahBatuImage,
  pagesangan: notaReservasiPagesanganImage,
  ampel: notaReservasiAmpelImage,
  sidoarjo: notaReservasiSidoarjoImage,
  bintaro: notaReservasiBintaroImage,
  bintarowaiters: notaReservasiBintaroImage,
};
const strukReservasiImageMap = {
  condet: strukReservasiCondetImage,
  karawaci: strukReservasiKarawaciImage,
  bsd: strukReservasiBsdImage,
  bsdwaiters: strukReservasiBsdImage,
  bandungkota: strukReservasiBandungKotaImage,
  bandungbuahbatu: strukReservasiBandungBuahBatuImage,
  pagesangan: strukReservasiPagesanganImage,
  ampel: strukReservasiAmpelImage,
  sidoarjo: strukReservasiSidoarjoImage,
  bintaro: strukReservasiBintaroImage,
  bintarowaiters: strukReservasiBintaroImage,
};
const notaPemesananImageMap = {
  condet: notaCondetImage,
  karawaci: notaKarawaciImage,
  bsd: notaBsdImage,
  bsdwaiters: notaBsdImage,
  bandungkota: notaBandungKotaImage,
  bandungbuahbatu: notaBandungBuahBatuImage,
  pagesangan: notaPagesanganImage,
  ampel: notaAmpelImage,
  sidoarjo: notaSidoarjoImage,
  bintaro: notaBintaroImage,
  bintarowaiters: notaBintaroImage,
};
const strukPemesananImageMap = {
  condet: strukPemesananCondetImage,
  karawaci: strukPemesananKarawaciImage,
  bsd: strukPemesananBsdImage,
  bsdwaiters: strukPemesananBsdImage,
  bandungkota: strukPemesananBandungKotaImage,
  bandungbuahbatu: strukPemesananBandungBuahBatuImage,
  pagesangan: strukPemesananPagesanganImage,
  ampel: strukPemesananAmpelImage,
  sidoarjo: strukPemesananSidoarjoImage,
  bintaro: strukPemesananBintaroImage,
  bintarowaiters: strukPemesananBintaroImage,
};

// Define the route for generating receipt
router.post("/generate-reservasi", async (req, res) => {
  const { order } = req.body;
  const branch = getBranchFromHeader(req);
  try {
    let htmlReceipt;
    if (order.status === 2) {
      const strukFn = strukReservasiMap[branch] || strukReservasiCondet;
      try {
        htmlReceipt = await strukFn(order);
      } catch (err) {
        console.error(
          `Error in strukReservasiMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan struk: ${err.message}`,
          });
      }
    } else {
      const notaFn = notaReservasiMap[branch] || notaReservasiCondet;
      try {
        htmlReceipt = await notaFn(order);
      } catch (err) {
        console.error(
          `Error in notaReservasiMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan nota: ${err.message}`,
          });
      }
    }
    res.json({ success: true, htmlReceipt });
  } catch (error) {
    console.error("Error in /generate-reservasi:", error.stack || error);
    res
      .status(500)
      .json({ success: false, message: "Gagal menghasilkan struk" });
  }
});

router.post("/generate-pemesanan", async (req, res) => {
  const { order } = req.body;
  const branch = getBranchFromHeader(req);
  try {
    let htmlReceipt;
    if (order.status === 2) {
      const strukFn = strukPemesananMap[branch] || strukPemesananCondet;
      try {
        htmlReceipt = await strukFn(order);
      } catch (err) {
        console.error(
          `Error in strukPemesananMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan struk: ${err.message}`,
          });
      }
    } else {
      const notaFn = notaPemesananMap[branch] || notaCondet;
      try {
        htmlReceipt = await notaFn(order);
      } catch (err) {
        console.error(
          `Error in notaPemesananMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan nota: ${err.message}`,
          });
      }
    }
    res.json({ success: true, htmlReceipt });
  } catch (error) {
    console.error("Error in /generate-pemesanan:", error.stack || error);
    res
      .status(500)
      .json({ success: false, message: "Gagal menghasilkan struk" });
  }
});

// Route untuk generate image reservasi
router.post("/generate-reservasi-image", async (req, res) => {
  const { order } = req.body;
  const branch = getBranchFromHeader(req);
  try {
    let htmlReceipt;
    if (order.status === 2) {
      // Gunakan image controller untuk struk reservasi
      const strukImageFn = strukReservasiImageMap[branch] || strukReservasiCondetImage;
      try {
        htmlReceipt = await strukImageFn(order);
      } catch (err) {
        console.error(
          `Error in strukReservasiImageMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan struk image: ${err.message}`,
          });
      }
    } else {
      // Gunakan image controller untuk nota reservasi
      const notaImageFn = notaReservasiImageMap[branch] || notaReservasiCondetImage;
      try {
        htmlReceipt = await notaImageFn(order);
      } catch (err) {
        console.error(
          `Error in notaReservasiImageMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan nota image: ${err.message}`,
          });
      }
    }
    
    // Return HTML string instead of image for frontend processing
    res.json({ 
      success: true, 
      htmlReceipt,
      message: "HTML struk berhasil dihasilkan" 
    });
  } catch (error) {
    console.error("Error in /generate-reservasi-image:", error.stack || error);
    res
      .status(500)
      .json({ success: false, message: "Gagal menghasilkan struk image" });
  }
});

// Route untuk generate image pemesanan
router.post("/generate-pemesanan-image", async (req, res) => {
  const { order } = req.body;
  const branch = getBranchFromHeader(req);
  try {
    let htmlReceipt;
    if (order.status === 2) {
      // Gunakan image controller untuk struk pemesanan
      const strukImageFn = strukPemesananImageMap[branch] || strukPemesananCondetImage;
      try {
        htmlReceipt = await strukImageFn(order);
      } catch (err) {
        console.error(
          `Error in strukPemesananImageMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan struk image: ${err.message}`,
          });
      }
    } else {
      // Gunakan image controller untuk nota pemesanan
      const notaImageFn = notaPemesananImageMap[branch] || notaCondetImage;
      try {
        htmlReceipt = await notaImageFn(order);
      } catch (err) {
        console.error(
          `Error in notaPemesananImageMap for branch ${branch}:`,
          err.stack || err
        );
        return res
          .status(500)
          .json({
            success: false,
            message: `Gagal menghasilkan nota image: ${err.message}`,
          });
      }
    }
    
    // Return HTML string instead of image for frontend processing
    res.json({ 
      success: true, 
      htmlReceipt,
      message: "HTML struk berhasil dihasilkan" 
    });
  } catch (error) {
    console.error("Error in /generate-pemesanan-image:", error.stack || error);
    res
      .status(500)
      .json({ success: false, message: "Gagal menghasilkan struk image" });
  }
});

// Route untuk convert HTML ke image (deprecated - processing moved to frontend)
router.post("/convert-html-to-image", async (req, res) => {
  try {
    const { html } = req.body;
    
    if (!html) {
      return res.status(400).json({
        success: false,
        message: "HTML content is required"
      });
    }

    // Return HTML for frontend processing instead of server-side image conversion
    res.json({ 
      success: true, 
      htmlReceipt: html,
      message: "HTML berhasil diterima, silakan proses di frontend" 
    });
  } catch (error) {
    console.error("Error in /convert-html-to-image:", error.stack || error);
    res.status(500).json({ 
      success: false, 
      message: "Gagal memproses HTML" 
    });
  }
});

module.exports = router;
