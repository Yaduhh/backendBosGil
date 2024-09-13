// server.js
const express = require("express");
const axios = require("axios");
const cors = require("cors");
const db = require("./db");
const path = require("path");
const multer = require("multer");

const app = express();
const port = 3000;
const ordersRouter = require("./routes/orders");
const menuRouter = require("./routes/menu");
const daftarAkunRouter = require("./routes/daftarAkun");
const deleteMenuRouter = require("./routes/deleteMenu");
const addProdukRouter = require("./routes/addProduk");
const editProdukRouter = require("./routes/editProduk");
const editUserRouter = require("./routes/updateUser");
const loginRouter = require("./routes/login");
const registerRouter = require("./routes/register");
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

app.use(express.json());

const corsOptions = {
  origin: "*",
  methods: ["GET", "POST", "PUT", "DELETE"],
  allowedHeaders: ["Content-Type"],
};

app.use(cors(corsOptions));

app.use((req, res, next) => {
  next();
});

// Routes
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
    return res.status(400).send("Nama pelanggan harus diisi");
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

  console.log(
    "ini yang diterima backend orderan buat : " + formattedOrderanBuat
  );

  const sql =
    "INSERT INTO orders (name, pesanan, normalprice, price, status, refund, progress, date, cashier, noted, nophone, alamat, ongkir, orderanBuat, pengambilan, timeDeliver, kurir, pajak) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  db.query(
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
      pajak,
    ],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("Error saving to database");
      }
      res.status(200).send("Order saved to database");
    }
  );
});

// Gunakan router orders untuk semua permintaan ke /orders
app.use("/getorders", ordersRouter);
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

// app.use("/daftarAkun", daftarAkunRouter);

app.use("/checkStock", checkStockRouter);
app.use("/reduceStock", reduceStockRouter);
app.use("/getmenu", menuRouter);
app.use("/addproduk", addProdukRouter);
app.use("/delete", deleteMenuRouter);
app.use("/edit", editProdukRouter);

// Login & register
app.use("/register", registerRouter);
app.use("/login", loginRouter);
app.use("/", editUserRouter);

// Khusus Admin
app.get("/daftarAkun", akunController.getAccounts);
app.delete("/deleteAkun/:id", akunController.deleteAccount);
app.put("/editAkun/:id", akunController.editAccount);

app.use("/assets", express.static(path.join(__dirname, "assets")));
app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.listen(port, "0.0.0.0", () => {
  console.log(`Server running at http://localhost:${port}`);
});
