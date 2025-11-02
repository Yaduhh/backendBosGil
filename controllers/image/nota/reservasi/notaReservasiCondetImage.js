const {
  formatTanggal,
  formatTime,
  formatDateStruk,
  formatHarga,
} = require("../../../../utils/formatUtils");

/**
 * Menyesuaikan dan memformat waktu.
 * @param {string} timeDeliver - Waktu dalam format "HH:mm".
 * @returns {string} Waktu yang telah diformat.
 */
const adjustTimeDeliver = (timeDeliver) => {
  if (!timeDeliver || !timeDeliver.includes(":")) return ""; // Menangani input yang tidak valid
  const [hours, minutes] = timeDeliver.split(":").map(Number);
  const date = new Date();
  date.setHours(hours, minutes);
  return date.toTimeString().slice(0, 5);
};

/**
 * Menghasilkan markup HTML untuk gambar nota reservasi dengan desain yang modern dan profesional.
 * @param {object} order - Objek yang berisi detail reservasi.
 * @returns {string} String HTML untuk nota.
 */
const notaReservasiCondetImage = async (order) => {
  // --- Informasi Outlet & Kontak ---
  const outlet = "NASI MANDHI BOSGIL CONDET";
  const storeAddress =
    "Jl. RAYA CONDET NO.5 RT.5/RW 6 CILILITAN KRAMAT JATI JAKARTA";
  const phoneNumber = "0811-9058-817";
  const phoneNumber1 = "0811-9291-531";

  // --- Informasi Bank ---
  const bank_bca = "8840 999 298";
  const nama_bank_bca = "CV. Makanan Segala Acara";
  const bank_mandiri = "155 0013 888 980";
  const nama_bank_mandiri = "CV. Makanan Segala Acara";

  // --- Parsing Data Pesanan ---
  const parsedPesanan = JSON.parse(order.pesanan);

  // --- Template HTML dengan Desain Baru ---
  return `
    <!DOCTYPE html>
    <html lang="id">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
      <title>Nota Reservasi</title>
      <style>
        /* --- Reset & Basic Styling --- */
        body {
          margin: 0;
          font-family: 'Inter', sans-serif;
          background-color: #F9FAFB;
          color: #1F2937;
          font-size: 14px;
          line-height: 1.6;
        }

        /* --- Container Utama --- */
        .receipt-container {
          max-width: 420px;
          margin: 0 auto;
          padding: 24px;
          background-color: #FFFFFF;
          box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
        }

        /* --- Header --- */
        .header {
          text-align: center;
          padding-bottom: 20px;
        }
        .header img {
          width: 200px;
          height: auto;
          margin-bottom: 12px;
        }
        .header .receipt-title {
          font-size: 24px;
          font-weight: 700;
          color: #B91C1C; /* Aksen merah utama */
          margin-bottom: 16px;
        }
        .header .outlet-name {
          font-size: 18px;
          font-weight: 600;
          color: #1F2937;
        }
        .header .address, .header .phone {
          font-size: 13px;
          color: #4B5563;
          margin-top: 4px;
        }

        /* --- Separator / Garis Pemisah --- */
        .separator {
          border: 0;
          border-top: 1px dashed #D1D5DB;
          margin: 20px 0;
        }

        /* --- Section Styling --- */
        .section-title {
          font-weight: 600;
          font-size: 16px;
          margin-bottom: 12px;
          color: #374151;
        }
        .info-grid {
          display: grid;
          grid-template-columns: 130px 1fr;
          gap: 8px;
          font-size: 16px;
        }
        .info-grid .label {
          color: #4B5563;
        }
        .info-grid .value {
          font-weight: 600;
          word-break: break-word;
        }
        .info-grid .value.highlight {
          font-weight: 700;
          color: #1F2937;
        }

        /* --- Order Items --- */
        .order-items .item {
          display: grid;
          grid-template-columns: 1fr auto;
          gap: 4px;
          margin-bottom: 12px;
        }
        .order-items .item-details {
          grid-column: 1 / -1;
        }
        .order-items .item-name {
          font-weight: 600;
        }
        .order-items .item-qty-price {
          font-size: 13px;
          color: #4B5563;
        }
        .order-items .item-total {
          font-weight: 600;
          text-align: right;
          align-self: end;
        }
        .order-items .item-note {
          grid-column: 1 / -1;
          font-size: 12px;
          color: #6B7280;
          font-style: italic;
          padding-left: 12px;
          border-left: 2px solid #E5E7EB;
        }

        /* --- Totals Section --- */
        .totals-section .total-row {
          display: flex;
          justify-content: space-between;
          margin-bottom: 6px;
          font-size: 15px;
        }
        .totals-section .grand-total {
          font-size: 18px;
          font-weight: 700;
          color: #B91C1C;
          padding-top: 10px;
          margin-top: 10px;
          border-top: 2px solid #1F2937;
        }

        /* --- Footer --- */
        .footer {
          text-align: center;
          padding-top: 20px;
        }
        .footer .bank-info {
          margin-bottom: 20px;
        }
        .footer .bank-name {
          font-weight: 600;
        }
        .footer .bank-details {
          font-size: 13px;
          color: #4B5563;
        }
        .footer .hashtags {
          font-weight: 500;
          color: #4B5563;
          margin-top: 20px;
        }
        .footer .qr-code {
          width: 140px;
          height: auto;
          margin: 16px 0;
        }
        .footer .thank-you {
          font-size: 16px;
          font-weight: 600;
          color: #374151;
        }
      </style>
    </head>
    <body>
      <div class="receipt-container">

        <!-- Header -->
        <header class="header">
          <div class="receipt-title">NOTA RESERVASI</div>
          <img src="https://bosgilakademi.com/logoBosgil.jpg" alt="Logo Bosgil">
          <div class="outlet-name">${outlet}</div>
          <div class="address">${storeAddress}</div>
          <div class="phone">Admin 1: ${phoneNumber} | Admin 2: ${phoneNumber1}</div>
        </header>

        <hr class="separator">

        <!-- Detail Transaksi -->
        <section>
          <div class="info-grid">
            <div class="label">No. TRX</div>
            <div class="value">${order.id}${formatDateStruk(order.date)}</div>
            <div class="label">Tanggal Dibuat</div>
            <div class="value">${formatTanggal(order.date)} | ${formatTime(
    order.date
  )}</div>
            <div class="label">Kasir</div>
            <div class="value">${order.cashier_name}</div>
          </div>
        </section>

        <hr class="separator">

        <!-- Detail Reservasi -->
        <section>
          <div class="section-title">Informasi Reservasi</div>
          <div class="info-grid">
            <div class="label">Nama Customer</div>
            <div class="value highlight">${order.name}</div>
            <div class="label">No. Telepon</div>
            <div class="value highlight">0${
              String(order.nophone).startsWith("62")
                ? String(order.nophone).slice(2)
                : order.nophone
            }</div>
            <div class="label">Ruangan</div>
            <div class="value">${order.vip}</div>
            <div class="label">Jumlah Tamu</div>
            <div class="value">${order.jumlah_orang} Orang</div>
            <div class="label">Tgl. Reservasi</div>
            <div class="value">${formatTanggal(order.orderanBuat)}</div>
            <div class="label">Waktu</div>
            <div class="value">${adjustTimeDeliver(
              order.from_jam
            )} - ${adjustTimeDeliver(order.until_jam)}</div>
            ${
              order.noted
                ? `
              <div class="label">Catatan</div>
              <div class="value">${order.noted}</div>
            `
                : ""
            }
          </div>
        </section>
        
        <hr class="separator">

        <!-- Rincian Pesanan -->
        <section class="order-items">
          <div class="section-title">Detail Pesanan</div>
          ${parsedPesanan
            .map(
              (item) => `
            <div class="item">
              <div class="item-details">
                <div class="item-name">${item.menu}</div>
                <div class="item-qty-price">${item.jumlah} x ${formatHarga(
                parseFloat(item.hargasatuan)
              )}</div>
              </div>
              <div class="item-total">Rp ${formatHarga(
                parseFloat(item.hargasatuan) * item.jumlah
              )}</div>
              ${
                item.catatan
                  ? `<div class="item-note">Note: ${item.catatan}</div>`
                  : ""
              }
            </div>
          `
            )
            .join("")}
        </section>

        <hr class="separator">

        <!-- Rincian Total -->
        <section class="totals-section">
          <div class="total-row grand-total">
            <div class="label">TOTAL</div>
            <div class="value">Rp ${formatHarga(order.price)}</div>
          </div>
          
          ${
            order.dp > 0
              ? `
            <div class="total-row" style="margin-top: 16px;">
              <div class="label">DP (${order.bank})</div>
              <div class="value">- Rp ${formatHarga(order.dp)}</div>
            </div>
            <div class="total-row" style="font-weight: 700;">
              <div class="label">Sisa Bayar</div>
              <div class="value">Rp ${formatHarga(order.sisa)}</div>
            </div>
          `
              : ""
          }
        </section>

        <!-- Footer -->
        <footer class="footer">
          <hr class="separator">
          <div class="bank-info">
            <div class="bank-name">BANK BCA</div>
            <div class="bank-details">${bank_bca} a/n ${nama_bank_bca}</div>
          </div>
          <div class="bank-info">
            <div class="bank-name">BANK MANDIRI</div>
            <div class="bank-details">${bank_mandiri} a/n ${nama_bank_mandiri}</div>
          </div>
          
          <div class="hashtags">
            #KITAPASTIBISA #MAKANANSEGALAACARA
            <br>
            IG & TikTok: @bosgildahsyat
          </div>
          
          <img src="https://bosgilakademi.com/QR.jpg" alt="QR Code Pembayaran" class="qr-code">
          
          <div class="thank-you">Terima Kasih!</div>
        </footer>

      </div>
    </body>
    </html>
  `;
};

module.exports = {
  notaReservasiCondetImage,
};
