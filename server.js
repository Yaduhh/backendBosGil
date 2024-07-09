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
const deleteMenuRouter = require("./routes/deleteMenu");
const addProdukRouter = require("./routes/addProduk");
const editProdukRouter = require("./routes/editProduk");
const loginRouter = require("./routes/login");
const { updateOrder } = require("./controllers/orderController");
const { updateStatus } = require("./controllers/orderController");

app.use(express.json());

const corsOptions = {
  origin: ["http://192.168.1.10:8081", " http://192.168.1.7:8081"],
  methods: ["GET", "POST", "PUT", "DELETE"],
  allowedHeaders: ["Content-Type"],
};

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const upload = multer({ storage: storage });

// Routes
app.post("/orders", (req, res) => {
  const { nama, pesanan, price, normalprice } = req.body;

  // Validasi bahwa 'nama' tidak boleh kosong
  if (!nama || nama.trim() === "") {
    return res.status(400).send("Nama pelanggan harus diisi");
  }

  const now = new Date();
  const formattedDate = `${now.getFullYear()}-${String(
    now.getMonth() + 1
  ).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")} ${String(
    now.getHours()
  ).padStart(2, "0")}:${String(now.getMinutes()).padStart(2, "0")}:${String(
    now.getSeconds()
  ).padStart(2, "0")}`;

  // Lanjutkan dengan penyimpanan ke database jika valid
  const status = false;
  const refund = 0;
  const progress = false;

  const sql =
    "INSERT INTO orders (name, pesanan, normalprice, price, status, refund, progress, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
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
app.post("/orders/:id/refund", updateOrder);
app.post("/orders/:id/progress", updateStatus);

app.use("/getmenu", menuRouter);
app.use("/addproduk", addProdukRouter);
app.use("/delete", deleteMenuRouter);
app.use("/edit", editProdukRouter);
app.use("/login", loginRouter);

app.use("/assets", express.static(path.join(__dirname, "assets")));
app.use(cors(corsOptions));
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
