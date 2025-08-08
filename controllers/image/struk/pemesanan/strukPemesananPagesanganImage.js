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

const strukPemesananPagesanganImage = async (order) => {
  const outlet = "NASI MANDHI BOSGIL PAGESANGAN";
  const storeAddress = "Jl. RAYA PAGESANGAN NO.5 RT.5/RW 6 PAGESANGAN SURABAYA";
  const phoneNumber = "08119058817";
  const phoneNumber1 = "08119291531";
  const parsedPesanan = JSON.parse(order.pesanan);

  return `
    <div class="receipt-container">
      <div class="header">
        <div class="logo-section">
          <div class="logo">🍜</div>
          <div class="brand-info">
            <h1 class="brand-name">BOS GIL</h1>
            <p class="tagline">Warung Mie Ayam & Bakso</p>
          </div>
        </div>
        <div class="receipt-info">
          <h2 class="receipt-title">STRUK PEMESANAN</h2>
          <p class="receipt-number">No: ${order.id}</p>
          <p class="receipt-date">${formatDateStruk(order.created_at)}</p>
        </div>
      </div>

      <div class="customer-info">
        <div class="info-row">
          <span class="label">Outlet:</span>
          <span class="value">${outlet}</span>
        </div>
        <div class="info-row">
          <span class="label">Alamat:</span>
          <span class="value">${storeAddress}</span>
        </div>
        <div class="info-row">
          <span class="label">Telp:</span>
          <span class="value">${phoneNumber} / ${phoneNumber1}</span>
        </div>
        <div class="info-row">
          <span class="label">Nama:</span>
          <span class="value">${order.nama || '-'}</span>
        </div>
        <div class="info-row">
          <span class="label">No. HP:</span>
          <span class="value">${order.no_hp || '-'}</span>
        </div>
        <div class="info-row">
          <span class="label">Alamat:</span>
          <span class="value">${order.alamat || '-'}</span>
        </div>
        <div class="info-row">
          <span class="label">Tanggal:</span>
          <span class="value">${formatTanggal(order.created_at)}</span>
        </div>
        <div class="info-row">
          <span class="label">Jam:</span>
          <span class="value">${formatTime(order.created_at)}</span>
        </div>
        ${order.time_deliver ? `
          <div class="info-row">
            <span class="label">Jam Kirim:</span>
            <span class="value">${adjustTimeDeliver(order.time_deliver)}</span>
          </div>
        ` : ''}
      </div>

      <div class="order-details">
        <h3 class="section-title">Detail Pesanan</h3>
        <div class="items-list">
          ${parsedPesanan.map(item => `
            <div class="item-row">
              <div class="item-info">
                <span class="item-name">${item.nama}</span>
                <span class="item-notes">${item.catatan ? `(${item.catatan})` : ''}</span>
              </div>
              <div class="item-quantity">${item.jumlah}x</div>
              <div class="item-price">${formatHarga(item.harga)}</div>
            </div>
          `).join('')}
        </div>
      </div>

      <div class="total-section">
        <div class="total-row">
          <span class="label">Subtotal:</span>
          <span class="value">${formatHarga(order.total_harga)}</span>
        </div>
        ${order.ongkir > 0 ? `
          <div class="total-row">
            <span class="label">Ongkir:</span>
            <span class="value">${formatHarga(order.ongkir)}</span>
          </div>
        ` : ''}
        <div class="total-row final">
          <span class="label">Total:</span>
          <span class="value">${formatHarga(order.total_harga + order.ongkir)}</span>
        </div>
      </div>

      <div class="payment-info">
        <div class="info-row">
          <span class="label">Metode Pembayaran:</span>
          <span class="value">${order.metode_pembayaran || 'Tunai'}</span>
        </div>
        <div class="info-row">
          <span class="label">Status:</span>
          <span class="value status-${order.status}">${order.status === 1 ? 'Menunggu Pembayaran' : order.status === 2 ? 'Sudah Dibayar' : 'Selesai'}</span>
        </div>
      </div>

      <div class="footer">
        <p class="thank-you">Terima Kasih Atas Kunjungan Anda</p>
        <p class="footer-text">Semoga hidangan kami sesuai dengan selera Anda</p>
        <div class="qr-section">
          <div class="qr-placeholder">📱</div>
          <p class="qr-text">Scan untuk feedback</p>
        </div>
      </div>
    </div>
  `;
};

module.exports = {
  strukPemesananPagesanganImage
};