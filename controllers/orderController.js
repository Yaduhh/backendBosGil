const db = require("../db");
const multer = require("multer");
const path = require("path");
const fs = require("fs");

exports.getOrders = (req, res) => {
  db.query("SELECT * FROM orders", (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results);
    }
  });
};

const getOrderNameMiddleware = (req, res, next) => {
  const { id } = req.params;
  const query = "SELECT name FROM orders WHERE id = ?";

  db.query(query, [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    req.orderName = results[0].name.replace(/\s+/g, "_");
    next();
  });
};

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads");
  },
  filename: (req, file, cb) => {
    const orderName = req.orderName || Date.now(); // Gunakan nama order atau timestamp sebagai fallback
    const now = new Date();
    const formattedDate = `${now.getFullYear()}-${String(
      now.getMonth() + 1
    ).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}_${String(
      now.getHours()
    ).padStart(2, "0")}-${String(now.getMinutes()).padStart(2, "0")}-${String(
      now.getSeconds()
    ).padStart(2, "0")}`;
    const filename = `${orderName}_${formattedDate}${path.extname(
      file.originalname
    )}`;
    cb(null, filename);
  },
});

const storageImageDp = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/dp"); // Folder khusus untuk imageDp
  },
  filename: (req, file, cb) => {
    const orderName = req.orderName || Date.now();
    const now = new Date();
    const formattedDate = `${now.getFullYear()}-${String(
      now.getMonth() + 1
    ).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}_${String(
      now.getHours()
    ).padStart(2, "0")}-${String(now.getMinutes()).padStart(2, "0")}-${String(
      now.getSeconds()
    ).padStart(2, "0")}`;
    const filename = `${orderName}_${formattedDate}${path.extname(
      file.originalname
    )}`;
    cb(null, filename);
  },
});

const upload = multer({ storage: storage });
const uploadDp = multer({ storage: storageImageDp });
exports.uploadOrderImage = upload.single("image");
exports.uploadOrderImageDp = uploadDp.single("image");

exports.updateOrder = (req, res) => {
  const { id } = req.params;
  const { pay, status, refund, banklunas } = req.body;
  const image = req.file ? req.file.filename : null;
  const query =
    "UPDATE orders SET pay = ?, status = ?, refund = ?, image = ?, banklunas = ?, progress = 1 WHERE id = ?";

  db.query(
    query,
    [pay, status, refund, image, banklunas, id],
    (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json({ message: "Order updated successfully" });
      }
    }
  );
};

exports.updateOrderDp = (req, res) => {
  const { id } = req.params;
  const { dp, sisa, status, nameDriver, nomorDriver, bank } = req.body;
  const imageDp = req.file ? req.file.filename : null;
  const query =
    "UPDATE orders SET dp = ?, sisa = ?, status = ?, imageDp = ?, nameDriver = ?, nomorDriver = ?, bank = ?, progress = 1 WHERE id = ?";

  db.query(
    query,
    [dp, sisa, status, imageDp, nameDriver, nomorDriver, bank, id],
    (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json({ message: "Dp Berhasil diterima!" });
      }
    }
  );
};

// CHANGE IDENTITY DRIVER
exports.updateOrderDriver = (req, res) => {
  const { id } = req.params;
  const { nameDriver, nomorDriver } = req.body;

  console.log(id, nameDriver, nomorDriver);
  const query =
    "UPDATE orders SET nameDriver = ?, nomorDriver = ? WHERE id = ?";

  db.query(query, [nameDriver, nomorDriver, id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: "Dp Berhasil diterima!" });
    }
  });
};

exports.updateStatus = (req, res) => {
  const { id } = req.params;
  const { progress } = req.body;
  const query = "UPDATE orders SET progress = ? WHERE id = ?";

  db.query(query, [progress, id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: "Order updated successfully" });
    }
  });
};

exports.deleteOrder = (req, res) => {
  const { id } = req.params;
  const { parsedPesanan } = req.body;
  // Dapatkan nama file gambar yang terkait dengan order
  const queryGetImage = "SELECT image FROM orders WHERE id = ?";

  db.query(queryGetImage, [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    const imageName = results[0].image;

    // Hapus order dari database
    const queryDeleteOrder = "DELETE FROM orders WHERE id = ?";

    db.query(queryDeleteOrder, [id], (err, result) => {
      if (err) {
        return res.status(500).json({ error: err.message });
      }

      // Jika ada gambar, hapus dari filesystem
      if (imageName) {
        const imagePath = path.join(__dirname, "..", "uploads", imageName);

        fs.unlink(imagePath, (err) => {
          if (err) {
            console.error("Failed to delete image file:", err);
          }
        });
      }

      // Update stok menu berdasarkan parsedPesanan
      if (parsedPesanan) {
        parsedPesanan.forEach((item) => {
          const queryUpdateStock =
            "UPDATE menu SET stock = stock + ? WHERE name = ?";
          db.query(queryUpdateStock, [item.jumlah, item.menu], (err) => {
            if (err) {
              console.error("Failed to update menu stock:", err);
            }
          });
        });
      }

      res.json({ message: "Order deleted successfully" });
    });
  });
};

exports.updateOrderPesanan = (req, res) => {
  const { id } = req.params;
  const {
    normalprice,
    price,
    nama,
    noted,
    alamat,
    nophone,
    ongkir,
    orderanBuat,
    pengambilan,
    timeDeliver,
    kurir,
    pajak,
    pesanan,
  } = req.body;

  // Konversi orderanBuat untuk mengatasi perbedaan waktu
  const correctedOrderanBuat = new Date(orderanBuat);
  correctedOrderanBuat.setHours(correctedOrderanBuat.getHours());

  // Pertama, ambil nilai dp dan status dari database
  const selectQuery = `SELECT dp, status FROM orders WHERE id = ?`;

  db.query(selectQuery, [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    // Ambil nilai dp dan status dari hasil query
    const dp = results[0].dp;
    let status = results[0].status;

    // Ubah status jika status saat ini adalah 2, jadikan 1
    if (status === 2) {
      status = 1;
    }

    // Hitung sisa (balance)
    const sisa = dp ? price - dp : price;

    // Lanjutkan dengan update order setelah mendapatkan dp dan status
    const updateQuery = `
      UPDATE orders SET 
        normalprice = ?, 
        price = ?, 
        sisa = ?,
        name = ?, 
        noted = ?, 
        alamat = ?, 
        nophone = ?, 
        ongkir = ?, 
        orderanBuat = ?, 
        pengambilan = ?, 
        timeDeliver = ?, 
        kurir = ?, 
        pajak = ?,
        pesanan = ?,
        status = ?
      WHERE id = ?`;

    db.query(
      updateQuery,
      [
        normalprice,
        price,
        sisa,
        nama,
        noted,
        alamat,
        nophone,
        ongkir,
        correctedOrderanBuat,
        pengambilan,
        timeDeliver,
        kurir,
        pajak,
        JSON.stringify(pesanan),
        status, // masukkan status yang sudah diperbarui
        id,
      ],
      (err, result) => {
        if (err) {
          return res.status(500).json({ error: err.message });
        }

        // Check if any rows were affected
        if (result.affectedRows === 0) {
          return res.status(404).json({ error: "Order not found" });
        }

        res.json({ message: "Order updated successfully", status });
      }
    );
  });
};

exports.updateOrderPesananReservasi = (req, res) => {
  const { id } = req.params;
  const {
    normalprice,
    price,
    nama,
    noted,
    nophone,
    orderanBuat,
    pajak,
    pesanan,
    vip,
    from_jam,
    until_jam,
    jumlah_orang,
    status_reservasi
  } = req.body;

  // Konversi orderanBuat untuk mengatasi perbedaan waktu
  const correctedOrderanBuat = new Date(orderanBuat);
  correctedOrderanBuat.setHours(correctedOrderanBuat.getHours());

  // Pertama, ambil nilai dp dan status dari database
  const selectQuery = `SELECT dp, status FROM orders WHERE id = ?`;

  db.query(selectQuery, [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    // Ambil nilai dp dan status dari hasil query
    const dp = results[0].dp;
    let status = results[0].status;

    // Ubah status jika status saat ini adalah 2, jadikan 1
    if (status === 2) {
      status = 1;
    }

    // Hitung sisa (balance)
    const sisa = dp ? price - dp : price;

    // Lanjutkan dengan update order setelah mendapatkan dp dan status
    const updateQuery = `
      UPDATE orders SET 
        normalprice = ?, 
        price = ?, 
        sisa = ?,
        name = ?, 
        noted = ?,
        nophone = ?, 
        orderanBuat = ?, 
        pajak = ?,
        pesanan = ?,
        vip = ?,
        jumlah_orang = ?,
        from_jam = ?,
        until_jam = ?,
        status_reservasi = 0,
        dp = 0,
        pay = 0,
        sisa = 0,
        status = 0,
        progress = 0
      WHERE id = ?`;

    db.query(
      updateQuery,
      [
        normalprice,
        price,
        sisa,
        nama,
        noted,
        nophone,
        correctedOrderanBuat,
        pajak,
        JSON.stringify(pesanan),
        vip, 
        jumlah_orang,
        from_jam,
        until_jam,
        id,
      ],
      (err, result) => {
        if (err) {
          return res.status(500).json({ error: err.message });
        }

        // Check if any rows were affected
        if (result.affectedRows === 0) {
          return res.status(404).json({ error: "Order not found" });
        }

        res.json({ message: "Order updated successfully", status });
      }
    );
  });
};

exports.getOrderNameMiddleware = getOrderNameMiddleware;
