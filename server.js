// server.js
const express = require("express");
const cors = require("cors");
const db = require("./db");
const path = require("path");
const fs = require("fs");

const app = express();
const port = 3000;
const ordersRouter = require("./routes/orders");
const reservasiRouter = require("./routes/reservasi");
const menuRouter = require("./routes/menu");
const daftarAkunRouter = require("./routes/daftarAkun");
const deleteMenuRouter = require("./routes/deleteMenu");
const addProdukRouter = require("./routes/addProduk");
const detailProduk = require("./routes/detailProduk");
const editProdukRouter = require("./routes/editProduk");
const editUserRouter = require("./routes/updateUser");
const loginRouter = require("./routes/login");
const userRoutes = require("./routes/userRoutes")
const registerRouter = require("./routes/register");
const { updateOrderPesanan } = require("./controllers/orderController");
const { updateOrderPesananReservasi } = require("./controllers/orderController");
const { updateOrder } = require("./controllers/orderController");
const { updateOrderDp } = require("./controllers/orderController");
const { updateOrderDriver } = require("./controllers/orderController");
const { updateStatus } = require("./controllers/orderController");
const { deleteOrder } = require("./controllers/orderController");
const { uploadOrderImage } = require("./controllers/orderController");
const { uploadOrderImageDp } = require("./controllers/orderController");
const { getOrderNameMiddleware } = require("./controllers/orderController");
const checkStockRouter = require("./routes/checkStock");
const reduceStockRouter = require("./routes/reduceStock");

const akunController = require("./controllers/akunController");
const generateReceiptRoute = require("./routes/generateReceiptRoute");

app.use(express.json());

// CORS configuration
const corsOptions = {
  origin: true, // Allow all origins
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Content-Type", "x-branch-id", "Authorization"],
  credentials: true
};

app.use(cors(corsOptions));

// Middleware to select database based on request
const selectDatabase = (req, res, next) => {
  // Get branch from query parameter, header, or default to condet
  const branch = req.query.branch || req.headers['x-branch-id'] || 'condet';
  
  console.log('=== Database Selection ===');
  console.log('Request URL:', req.originalUrl);
  console.log('Headers:', JSON.stringify(req.headers, null, 2));
  console.log('Query params:', req.query);
  console.log('Selected branch:', branch);
  
  try {
    // Get the database pool for the specified branch
    req.db = db.getPool(branch);
    req.branch = branch;
    console.log('Using database:', db.dbConfigs[branch].database);
    console.log('=======================');
    next();
  } catch (error) {
    console.error('Database selection error:', error);
    return res.status(400).json({ 
      success: false,
      message: `Invalid branch selection: ${error.message}` 
    });
  }
};

// Apply the database selection middleware to all routes
app.use(selectDatabase);

// Create branch-specific directories
const createBranchDirectories = () => {
  const branches = Object.keys(db.dbConfigs);
  branches.forEach(branch => {
    const branchDir = path.join(__dirname, 'uploads', branch);
    const dpDir = path.join(branchDir, 'dp');
    const assetsDir = path.join(__dirname, 'assets', branch);
    
    if (!fs.existsSync(branchDir)) {
      fs.mkdirSync(branchDir, { recursive: true });
    }
    if (!fs.existsSync(dpDir)) {
      fs.mkdirSync(dpDir, { recursive: true });
    }
    if (!fs.existsSync(assetsDir)) {
      fs.mkdirSync(assetsDir, { recursive: true });
    }
  });
};

// Create directories on startup
createBranchDirectories();

// Routes
app.use("/", generateReceiptRoute);

app.post("/orders", (req, res) => {
  const {
    nama,
    pesanan,
    price,
    normalprice,
    cashier,
    noted,
    nophone,
    alamat,
    ongkir,
    orderanBuat,
    pengambilan,
    timeDeliver,
    kurir,
    pajak,
  } = req.body;

  if (!nama || nama.trim() === "") {
    return res.status(400).json({ error: "Nama pelanggan harus diisi" });
  }

  const orderanBuatDate = new Date(orderanBuat);
  const formattedOrderanBuat = `${orderanBuatDate.getFullYear()}-${String(
    orderanBuatDate.getMonth() + 1
  ).padStart(2, "0")}-${String(orderanBuatDate.getDate()).padStart(
    2,
    "0"
  )} ${String(orderanBuatDate.getHours()).padStart(2, "0")}:${String(
    orderanBuatDate.getMinutes()
  ).padStart(2, "0")}:${String(orderanBuatDate.getSeconds()).padStart(2, "0")}`;

  const now = new Date();
  const formattedDate = `${now.getFullYear()}-${String(
    now.getMonth() + 1
  ).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")} ${String(
    now.getHours()
  ).padStart(2, "0")}:${String(now.getMinutes()).padStart(2, "0")}:${String(
    now.getSeconds()
  ).padStart(2, "0")}`;

  const status = false;
  const refund = 0;
  const progress = false;

  const sql =
    "INSERT INTO orders (name, pesanan, normalprice, price, status, refund, progress, date, cashier, noted, nophone, alamat, ongkir, orderanBuat, pengambilan, timeDeliver, kurir, pajak) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  req.db.query(
    sql,
    [
      nama,
      JSON.stringify(pesanan),
      normalprice,
      price,
      status,
      refund,
      progress,
      formattedDate,
      cashier,
      noted,
      nophone,
      alamat,
      ongkir,
      formattedOrderanBuat,
      pengambilan,
      timeDeliver,
      kurir,
      pajak
    ],
    (err, result) => {
      if (err) {
        console.error("Error saving order to database:", err);
        return res.status(500).json({ error: "Gagal menyimpan order ke database" });
      }
      res.status(200).json({ 
        success: true,
        message: "Order berhasil disimpan",
        orderId: result.insertId 
      });
    }
  );
});

// Routes
app.post("/orders-reservasi", (req, res) => {
  const {
    nama,
    pesanan,
    price,
    normalprice,
    cashier,
    noted,
    nophone,
    orderanBuat,
    pajak,
    jumlah_orang,
    from_jam,
    until_jam,
    status_reservasi,
    vip,
  } = req.body;

  if (!nama || nama.trim() === "") {
    return res.status(400).json({ error: "Nama pelanggan harus diisi" });
  }

  const orderanBuatDate = new Date(orderanBuat);
  const formattedOrderanBuat = `${orderanBuatDate.getFullYear()}-${String(
    orderanBuatDate.getMonth() + 1
  ).padStart(2, "0")}-${String(orderanBuatDate.getDate()).padStart(
    2,
    "0"
  )} ${String(orderanBuatDate.getHours()).padStart(2, "0")}:${String(
    orderanBuatDate.getMinutes()
  ).padStart(2, "0")}:${String(orderanBuatDate.getSeconds()).padStart(2, "0")}`;

  const now = new Date();
  const formattedDate = `${now.getFullYear()}-${String(
    now.getMonth() + 1
  ).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")} ${String(
    now.getHours()
  ).padStart(2, "0")}:${String(now.getMinutes()).padStart(2, "0")}:${String(
    now.getSeconds()
  ).padStart(2, "0")}`;

  const status = false;
  const refund = 0;
  const progress = false;

  const sql =
    "INSERT INTO orders (name, pesanan, normalprice, price, status, refund, progress, date, cashier, noted, nophone, orderanBuat, pajak, from_jam, until_jam, jumlah_orang, vip, status_reservasi) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  req.db.query(
    sql,
    [
      nama,
      JSON.stringify(pesanan),
      normalprice,
      price,
      status,
      refund,
      progress,
      formattedDate,
      cashier,
      noted,
      nophone,
      formattedOrderanBuat,
      pajak,
      from_jam,
      until_jam,
      jumlah_orang,
      vip,
      status_reservasi
    ],
    (err, result) => {
      if (err) {
        console.error("Error saving reservation to database:", err);
        return res.status(500).json({ error: "Gagal menyimpan reservasi ke database" });
      }
      res.status(200).json({ 
        success: true,
        message: "Reservasi berhasil disimpan",
        orderId: result.insertId 
      });
    }
  );
});

// Gunakan router orders untuk semua permintaan ke /orders
app.use("/getorders", ordersRouter);
app.use("/getorders-reservasi", reservasiRouter);
app.post(
  "/orders/:id/refund",
  getOrderNameMiddleware,
  uploadOrderImage,
  updateOrder
);

app.post(
  "/orders/:id/dp",
  getOrderNameMiddleware,
  uploadOrderImageDp,
  updateOrderDp
);
app.post(
  "/orders/:id/driver",
  getOrderNameMiddleware,
  uploadOrderImageDp,
  updateOrderDriver
);
app.post("/orders/:id/progress", updateStatus);
app.delete("/orders/:id", deleteOrder);
app.put("/orders/update/:id", updateOrderPesanan);
app.put("/orders/update/reservasi/:id", updateOrderPesananReservasi);

// app.use("/daftarAkun", daftarAkunRouter);

app.use("/checkStock", checkStockRouter);
app.use("/reduceStock", reduceStockRouter);
app.use("/getmenu", menuRouter);
app.use("/getmenu", detailProduk);
app.use("/addproduk", addProdukRouter);
app.use("/delete", deleteMenuRouter);
app.use("/edit", editProdukRouter);

// Login & register
app.use("/register", registerRouter);
app.use("/login", loginRouter);
app.use("/", editUserRouter);

// User Routes
app.use("/api", userRoutes);  // This will handle all /api/* routes

// Khusus Admin
app.get("/daftarAkun", akunController.getAccounts);
app.delete("/deleteAkun/:id", akunController.deleteAccount);
app.put("/editAkun/:id", akunController.editAccount);

// Serve static files from branch-specific directories
app.use('/assets', express.static(path.join(__dirname, 'assets')));

app.use("/uploads", express.static(path.join(__dirname, "uploads")));

app.listen(port, "0.0.0.0", () => {
  console.log(`Server running at http://localhost:${port}`);
});
