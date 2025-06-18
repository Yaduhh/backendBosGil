const multer = require("multer");
const path = require("path");
const fs = require("fs");

exports.getOrders = async (req, res) => {
  try {
    const query = `
      SELECT o.*, u.name as cashier_name 
      FROM orders o 
      LEFT JOIN users u ON o.cashier = u.id 
      ORDER BY o.created_at DESC
    `;
    
    req.db.query(query, (error, results) => {
      if (error) {
        console.error("Error fetching orders:", error);
        return res.status(500).json({
          success: false,
          error: "Gagal mengambil data pesanan"
        });
      }
      
      res.json({
        success: true,
        data: results
      });
    });
  } catch (error) {
    console.error("Error in getOrders:", error);
    res.status(500).json({
      success: false,
      error: "Terjadi kesalahan saat mengambil data pesanan"
    });
  }
};

const getOrderNameMiddleware = (req, res, next) => {
  const { id } = req.params;
  const query = "SELECT name FROM orders WHERE id = ?";

  req.db.query(query, [id], (err, results) => {
    if (err) {
      console.error("Error in getOrderNameMiddleware:", err);
      return res.status(500).json({ 
        success: false,
        error: "Gagal mengambil data pesanan" 
      });
    }

    if (results.length === 0) {
      return res.status(404).json({ 
        success: false,
        error: "Pesanan tidak ditemukan" 
      });
    }

    req.orderName = results[0].name.replace(/\s+/g, "_");
    next();
  });
};

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const storageImageDp = multer.diskStorage({
  destination: (req, file, cb) => {
    const dpDir = path.join("uploads", "dp");
    if (!fs.existsSync(dpDir)) {
      fs.mkdirSync(dpDir, { recursive: true });
    }
    cb(null, dpDir);
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

exports.updateOrder = async (req, res) => {
  try {
    console.log('=== Update Order Request Start ===');
    console.log('Headers:', req.headers);
    console.log('Params:', req.params);
    console.log('Body:', req.body);
    console.log('File:', req.file);

    const { id } = req.params;
    let { status, pay, refund, banklunas } = req.body;

    // Handle FormData format
    if (req.body._parts) {
      const parts = req.body._parts;
      status = parts.find(p => p[0] === 'status')?.[1];
      pay = parts.find(p => p[0] === 'pay')?.[1];
      refund = parts.find(p => p[0] === 'refund')?.[1];
      banklunas = parts.find(p => p[0] === 'banklunas')?.[1];
    }

    const image = req.file ? req.file.filename : null;

    console.log('Processed data:', {
      status,
      pay,
      refund,
      banklunas,
      image
    });

    const updateData = {
      status: status ? parseInt(status) : undefined,
      pay: pay ? parseFloat(pay) : undefined,
      refund: refund ? parseFloat(refund) : undefined,
      banklunas,
      image,
      progress: 1
    };

    // Remove undefined values
    Object.keys(updateData).forEach(key => 
      updateData[key] === undefined && delete updateData[key]
    );

    console.log('Update data:', updateData);

    req.db.query(
      'UPDATE orders SET ? WHERE id = ?',
      [updateData, id],
      (error, result) => {
        if (error) {
          console.error("Database error:", {
            message: error.message,
            code: error.code,
            sqlMessage: error.sqlMessage,
            sqlState: error.sqlState
          });
          return res.status(500).json({
            success: false,
            error: "Gagal memperbarui pesanan",
            details: error.message
          });
        }

        if (result.affectedRows === 0) {
          console.log('No rows affected for order:', id);
          return res.status(404).json({
            success: false,
            error: "Pesanan tidak ditemukan"
          });
        }

        console.log('Successfully updated order:', id);
        res.json({
          success: true,
          message: "Pesanan berhasil diperbarui"
        });
      }
    );
  } catch (error) {
    console.error('Unexpected error in updateOrder:', {
      error: error.message,
      stack: error.stack,
      params: req.params,
      body: req.body,
      headers: req.headers
    });
    res.status(500).json({
      success: false,
      error: "Terjadi kesalahan saat memperbarui pesanan",
      details: error.message
    });
  } finally {
    console.log('=== Update Order Request End ===');
  }
};

exports.updateOrderDp = (req, res) => {
  try {
    console.log('=== DP Request Start ===');
    console.log('Headers:', req.headers);
    console.log('Params:', req.params);
    console.log('Body:', req.body);
    console.log('File:', req.file);

    const { id } = req.params;
    let { dp, sisa, status, nameDriver, nomorDriver, bank } = req.body;

    // Handle FormData format
    if (req.body._parts) {
      const parts = req.body._parts;
      dp = parts.find(p => p[0] === 'dp')?.[1];
      sisa = parts.find(p => p[0] === 'sisa')?.[1];
      status = parts.find(p => p[0] === 'status')?.[1];
      nameDriver = parts.find(p => p[0] === 'nameDriver')?.[1];
      nomorDriver = parts.find(p => p[0] === 'nomorDriver')?.[1];
      bank = parts.find(p => p[0] === 'bank')?.[1];
    }

    const imageDp = req.file ? req.file.filename : null;

    console.log('Processed data:', {
      dp,
      sisa,
      status,
      nameDriver,
      nomorDriver,
      bank,
      imageDp
    });

    // Validate required fields
    if (!dp || !sisa || !bank) {
      console.log('Validation failed - missing fields:', { dp, sisa, bank });
      return res.status(400).json({
        success: false,
        error: "DP, sisa pembayaran, dan bank harus diisi"
      });
    }

    // Validate numeric values
    if (isNaN(parseFloat(dp)) || isNaN(parseFloat(sisa))) {
      console.log('Validation failed - invalid numbers:', { dp, sisa });
      return res.status(400).json({
        success: false,
        error: "DP dan sisa pembayaran harus berupa angka"
      });
    }

    const query = `
      UPDATE orders 
      SET dp = ?, 
          sisa = ?, 
          status = ?, 
          imageDp = ?, 
          nameDriver = ?, 
          nomorDriver = ?, 
          bank = ?, 
          progress = 1 
      WHERE id = ?
    `;

    const values = [
      parseFloat(dp),
      parseFloat(sisa),
      parseInt(status) || 0,
      imageDp,
      nameDriver || null,
      nomorDriver || null,
      bank,
      id
    ];

    console.log('Executing query with values:', values);

    req.db.query(query, values, (err, result) => {
      if (err) {
        console.error('Database error:', {
          message: err.message,
          code: err.code,
          sqlMessage: err.sqlMessage,
          sqlState: err.sqlState
        });
        return res.status(500).json({ 
          success: false,
          error: "Gagal memperbarui DP pesanan",
          details: err.message
        });
      }
      if (result.affectedRows === 0) {
        console.log('No rows affected for order:', id);
        return res.status(404).json({ 
          success: false,
          error: "Pesanan tidak ditemukan" 
        });
      }
      console.log('Successfully updated DP for order:', id);
      res.json({ 
        success: true,
        message: "DP Berhasil diterima!" 
      });
    });
  } catch (error) {
    console.error('Unexpected error in updateOrderDp:', {
      error: error.message,
      stack: error.stack,
      params: req.params,
      body: req.body,
      headers: req.headers
    });
    res.status(500).json({
      success: false,
      error: "Terjadi kesalahan saat memperbarui DP",
      details: error.message
    });
  } finally {
    console.log('=== DP Request End ===');
  }
};

// CHANGE IDENTITY DRIVER
exports.updateOrderDriver = (req, res) => {
  const { id } = req.params;
  const { nameDriver, nomorDriver } = req.body;

  if (!nameDriver || !nomorDriver) {
    return res.status(400).json({
      success: false,
      error: "Nama dan nomor driver harus diisi"
    });
  }

  const query = `
    UPDATE orders 
    SET nameDriver = ?, 
        nomorDriver = ? 
    WHERE id = ?
  `;

  req.db.query(query, [nameDriver, nomorDriver, id], (err, result) => {
    if (err) {
      console.error("Error updating driver info:", err);
      return res.status(500).json({ 
        success: false,
        error: "Gagal memperbarui informasi driver" 
      });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ 
        success: false,
        error: "Pesanan tidak ditemukan" 
      });
    }
    res.json({ 
      success: true,
      message: "Informasi driver berhasil diperbarui" 
    });
  });
};

exports.updateStatus = (req, res) => {
  const { id } = req.params;
  const { progress } = req.body;

  if (progress === undefined) {
    return res.status(400).json({
      success: false,
      error: "Status progress harus diisi"
    });
  }

  const query = `
    UPDATE orders 
    SET progress = ? 
    WHERE id = ?
  `;

  req.db.query(query, [progress, id], (err, result) => {
    if (err) {
      console.error("Error updating order status:", err);
      return res.status(500).json({ 
        success: false,
        error: "Gagal memperbarui status pesanan" 
      });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ 
        success: false,
        error: "Pesanan tidak ditemukan" 
      });
    }
    res.json({ 
      success: true,
      message: "Status pesanan berhasil diperbarui" 
    });
  });
};

exports.deleteOrder = async (req, res) => {
  const { id } = req.params;
  
  try {
    req.db.query(
      'DELETE FROM orders WHERE id = ?',
      [id],
      (error, result) => {
        if (error) {
          console.error("Error deleting order:", error);
          return res.status(500).json({
            success: false,
            error: "Gagal menghapus pesanan"
          });
        }

        if (result.affectedRows === 0) {
          return res.status(404).json({
            success: false,
            error: "Pesanan tidak ditemukan"
          });
        }

        res.json({
          success: true,
          message: "Pesanan berhasil dihapus"
        });
      }
    );
  } catch (error) {
    console.error("Error in deleteOrder:", error);
    res.status(500).json({
      success: false,
      error: "Terjadi kesalahan saat menghapus pesanan"
    });
  }
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

  if (!normalprice || !price || !nama || !nophone) {
    return res.status(400).json({
      success: false,
      error: "Data pesanan tidak lengkap"
    });
  }

  const correctedOrderanBuat = new Date(orderanBuat);
  correctedOrderanBuat.setHours(correctedOrderanBuat.getHours());

  const selectQuery = `SELECT dp, status FROM orders WHERE id = ?`;

  req.db.query(selectQuery, [id], (err, results) => {
    if (err) {
      console.error("Error fetching order details:", err);
      return res.status(500).json({ 
        success: false,
        error: "Gagal mengambil detail pesanan" 
      });
    }

    if (results.length === 0) {
      return res.status(404).json({ 
        success: false,
        error: "Pesanan tidak ditemukan" 
      });
    }

    const dp = results[0].dp;
    let status = results[0].status;
    let progress = 1;

    if (status === 2) {
      status = 1;
      progress = 1;
    } else if (status === 1 ){
      status = 0;
      progress = 0;
    }

    const sisa = price - dp;
    const query = `
      UPDATE orders 
      SET normalprice = ?, 
          price = ?, 
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
          status = ?, 
          sisa = ?,
          pay = 0,
          progress = ?
      WHERE id = ?
    `;

    const values = [
      parseFloat(normalprice),
      parseFloat(price),
      nama,
      noted || null,
      alamat || null,
      nophone,
      parseFloat(ongkir) || 0,
      correctedOrderanBuat,
      pengambilan || null,
      timeDeliver || null,
      kurir || null,
      parseFloat(pajak) || 0,
      JSON.stringify(pesanan),
      status,
      sisa,
      progress,
      id
    ];

    req.db.query(query, values, (err, result) => {
      if (err) {
        console.error("Error updating order:", err);
        return res.status(500).json({ 
          success: false,
          error: "Gagal memperbarui pesanan" 
        });
      }
      if (result.affectedRows === 0) {
        return res.status(404).json({ 
          success: false,
          error: "Pesanan tidak ditemukan" 
        });
      }
      res.json({ 
        success: true,
        message: "Pesanan berhasil diperbarui" 
      });
    });
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

  if (!normalprice || !price || !nama || !nophone || !from_jam || !until_jam || !jumlah_orang) {
    return res.status(400).json({
      success: false,
      error: "Data reservasi tidak lengkap"
    });
  }

  const correctedOrderanBuat = new Date(orderanBuat);
  correctedOrderanBuat.setHours(correctedOrderanBuat.getHours());

  const selectQuery = `SELECT dp, status FROM orders WHERE id = ?`;

  req.db.query(selectQuery, [id], (err, results) => {
    if (err) {
      console.error("Error fetching reservation details:", err);
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

    const dp = results[0].dp;
    let status = results[0].status;

    if (status === 2) {
      status = 1;
    }

    const sisa = dp ? price - dp : price;

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

    const values = [
      parseFloat(normalprice),
      parseFloat(price),
      sisa,
      nama,
      noted || null,
      nophone,
      correctedOrderanBuat,
      parseFloat(pajak) || 0,
      JSON.stringify(pesanan),
      vip || null,
      parseInt(jumlah_orang),
      from_jam,
      until_jam,
      id
    ];

    req.db.query(updateQuery, values, (err, result) => {
      if (err) {
        console.error("Error updating reservation:", err);
        return res.status(500).json({ 
          success: false,
          error: "Gagal memperbarui reservasi" 
        });
      }

      if (result.affectedRows === 0) {
        return res.status(404).json({ 
          success: false,
          error: "Reservasi tidak ditemukan" 
        });
      }

      res.json({ 
        success: true,
        message: "Reservasi berhasil diperbarui",
        status 
      });
    });
  });
};

exports.getOrderNameMiddleware = getOrderNameMiddleware;
