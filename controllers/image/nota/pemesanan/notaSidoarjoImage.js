const { formatTanggal, formatTime, formatDateStruk, formatHarga } = require('../../../../utils/formatUtils');

const adjustTimeDeliver = (timeDeliver) => {
  const [hours, minutes] = timeDeliver.split(":").map(Number);
  const date = new Date();
  date.setHours(hours);
  date.setMinutes(minutes - 0);

  // Handle cases where minutes become negative and adjust accordingly
  const adjustedHours = date.getHours().toString().padStart(2, "0");
  const adjustedMinutes = date.getMinutes().toString().padStart(2, "0");

  return `${adjustedHours}:${adjustedMinutes}`;
};

/**
 * Menghasilkan markup HTML untuk gambar nota dengan desain yang modern dan profesional.
 * @param {object} order - Objek yang berisi detail pesanan.
 * @returns {string} String HTML untuk nota.
 */

const notaSidoarjoImage = async (order) => {
  const outlet = "NASI MANDHI BOSGIL SIDOARJO";
  const storeAddress = "Ruko Royal Palace, Jl. Sunandar Priyo Sudarmo Blok J9, Kuthuk, Larangan, Sidoarjo";
  const phoneNumber = "08119058817";
  const phoneNumber1 = "08119291531";
  const bank_bca = "8841 0101 16";
  const nama_bank_bca = "CV. Makanan Segala Acara";
  const bank_mandiri = "155 00 1417 3051";
  const nama_bank_mandiri = "CV. Makanan Segala Acara";
  const parsedPesanan = JSON.parse(order.pesanan);

  return `
    <!DOCTYPE html>
    <html lang="id">
    <head>
      <meta charset="UTF-g">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
      <title>Nota Pesanan</title>
      <style>
        /* --- Reset & Basic Styling --- */
        body {
          margin: 0;
          font-family: 'Inter', sans-serif;
          background-color: #F9FAFB; /* Sedikit abu-abu untuk background */
          color: #1F2937; /* Abu-abu gelap untuk teks agar nyaman dibaca */
          font-size: 14px;
          line-height: 1.6;
        }

        /* --- Container Utama --- */
        .receipt-container {
          max-width: 420px; /* Lebar umum struk thermal */
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
          width: 200px; /* Ukuran logo disesuaikan */
          height: auto;
          margin-bottom: 16px;
        }
        .header .outlet-name {
          font-size: 22px;
          font-weight: 700;
          color: #B91C1C; /* Aksen merah utama */
        }
        .header .address, .header .phone {
          font-size: 13px;
          color: #4B5563; /* Abu-abu untuk info sekunder */
          margin-top: 4px;
        }

        /* --- Separator / Garis Pemisah --- */
        .separator {
          border: 0;
          border-top: 1px dashed #D1D5DB; /* Garis putus-putus yang elegan */
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
          grid-template-columns: 120px 1fr; /* Kolom untuk label dan isi */
          gap: 6px;
font-size:16px;
        }
        .info-grid .label {
          color: #4B5563;
        }
        .info-grid .value {
          font-weight: 600;
          word-break: break-word; /* Agar teks panjang tidak overflow */
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
          grid-column: 1 / -1; /* Span full width */
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
        .totals-section .total-row .label {
          color: #374151;
        }
        .totals-section .total-row .value {
          font-weight: 600;
        }
        .totals-section .grand-total {
          font-size: 18px;
          font-weight: 700;
          color: #B91C1C; /* Aksen merah pada total akhir */
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

            <div class="label">Tanggal Buat</div>
            <div class="value">${formatTanggal(order.date)} | ${formatTime(
    order.date
  )}
            </div>
            
            <div class="label">Kasir</div>
            <div class="value">${order.cashier_name}</div>
          </div>
        </section>

        <hr class="separator">

        <!-- Detail Pelanggan & Pengiriman -->
        <section>
          <div class="section-title">Informasi Pesanan</div>
          <div class="info-grid">
            <div class="label">Nama Customer</div>
            <div class="value highlight">${order.name}</div>

            <div class="label">No. Telepon</div>
            <div class="value highlight">0${String(order.nophone).startsWith("62")
      ? String(order.nophone).slice(2)
      : order.nophone
    }</div>

            <div class="label">Alamat</div>
            <div class="value">${order.alamat}</div>
            
            <div class="label">Pesanan Untuk</div>
            <div class="value">${formatTanggal(order.orderanBuat)}</div>

            <div class="label">${order.pengambilan === "diambil"
      ? `Diambil Pukul`
      : `Dikirim Pukul`
    }</div>
            <div class="value">${adjustTimeDeliver(order.timeDeliver)}</div>
            
            <div class="label">Pengiriman</div>
            <div class="value" style="text-transform:capitalize;">${order.pengambilan
    }${order.kurir ? ` via ${order.kurir}` : ""}</div>
            
            ${order.noted
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
          <div class="section-title">Rincian Item</div>
          ${parsedPesanan
            .filter(item => !item.namaAqiqah) // Filter out aqiqah data from menu display
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

        ${parsedPesanan.some(item => item.namaAqiqah) ? `
        <hr class="separator">
        
        <!-- Data Aqiqah -->
        <section>
          <div class="section-title" style="color: #B91C1C; font-weight: 700;">📋 Data Aqiqah</div>
          <div class="info-grid">
            <div class="label">Nama yang di aqiqah</div>
            <div class="value highlight">${parsedPesanan.find(item => item.namaAqiqah)?.namaAqiqah || '-'}</div>
            
            <div class="label">Jenis Kelamin</div>
            <div class="value">${parsedPesanan.find(item => item.namaAqiqah)?.jenisKelamin || '-'}</div>
            
            <div class="label">Nama Ayah</div>
            <div class="value">${parsedPesanan.find(item => item.namaAqiqah)?.namaAyah || '-'}</div>
            
            <div class="label">Nama Ibu</div>
            <div class="value">${parsedPesanan.find(item => item.namaAqiqah)?.namaIbu || '-'}</div>
            
            <div class="label">Anak ke</div>
            <div class="value">${parsedPesanan.find(item => item.namaAqiqah)?.anakKe || '-'}</div>
            
            <div class="label">Tempat & Tanggal Lahir</div>
            <div class="value">${parsedPesanan.find(item => item.namaAqiqah)?.tempatTanggalLahir || '-'}</div>
          </div>
        </section>
        ` : ''}

        <hr class="separator">

        <!-- Rincian Total -->
        <section class="totals-section">
          <div class="total-row">
            <div class="label">Subtotal</div>
            <div class="value">Rp ${formatHarga(order.normalprice)}</div>
          </div>
          <div class="total-row">
            <div class="label">Biaya Ongkir</div>
            <div class="value">Rp ${formatHarga(order.ongkir)}</div>
          </div>
          <div class="total-row grand-total">
            <div class="label">TOTAL</div>
            <div class="value">Rp ${formatHarga(order.price)}</div>
          </div>
          
          ${order.dp > 0
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
          <div class="bank-info">
            <div class="bank-name">BANK BCA</div>
            <div class="bank-details">${bank_bca} a/n ${nama_bank_bca}</div>
          </div>
          <div class="bank-info">
            <div class="bank-name">BANK MANDIRI</div>
            <div class="bank-details">${bank_mandiri} a/n ${nama_bank_mandiri}</div>
          </div>
          
          <hr class="separator">
          
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
  notaSidoarjoImage
};