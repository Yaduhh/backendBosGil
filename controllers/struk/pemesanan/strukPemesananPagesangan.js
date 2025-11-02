const { formatTanggal, formatTime, formatDateStruk, formatHarga } = require('../../../utils/formatUtils');

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

const strukPemesananPagesangan = async (order) => {
  const outlet = "BOSGIL PAGESANGAN";
  const storeAddress =
    "JL. Taman Gayungsari Barat II No.38 Kota Suarabaya, Jawa Timur";
  const phoneNumber = "0811-8668-857";
  const parsedPesanan = JSON.parse(order.pesanan);

  return `
      <html>
        <head>
          <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap">
          <style>
            body {
              font-family: Arial, sans-serif;
              font-weight: 400;
              font-size: 24px;
              background-color: #FFF;
              width: 400px;
              padding: 5px;
              heigth: auto;
              margin: 0 auto;
              overflow: hidden;
              text-align: justify;
              min-height: 50px;
              color:#000;
            }
            .header {
              text-align: center;
              margin-bottom: 2px;
            }
            .header, .receipt-body, .thanks {
              margin: 0;
              padding: 0;
            }
            .title {
              font-size: 24px;
              font-weight: 500,
              margin-bottom: 5px;
              margin-top: -2px;
              color:#000;
            }
            .info {
              font-size: 24px;
              font-weight: 500,
              color:#000;
            }
            .info-catatan {
              margin-bottom:10px;
            }
            .thanks {
              text-align: center;
              margin-top: 3px;
              font-weight: 500,
              color:#000;
              font-size: 24px;
            }
            .receipt-body {
              margin-top: 10px;
              font-weight: 500,
              text-align: justify;
              color: #000;
            }
            .receipt-body .info {
              margin-bottom: 0px;
              font-weight: 500,
            }
            .titleStruk {
              font-size: 24px;
              font-weight: bold;
              margin-bottom: 5px;
              text-align: center;
            }
            .info-row {
              display: flex;
              justify-content: space-between;
              margin-bottom: 2px; 
            }
            .info-row-format {
              display: flex;
              width: 150;
              justify-content: space-between;
              margin-bottom: 2px;
              padding-right: 1px;
            }
            .info-row-menu {
              display: flex;
              justify-content: space-between;
              margin-bottom: 3px;
            }
            .underline {
              border-bottom: 2px dashed #000;
              border-spacing: 20px; 
              padding-horizontal: 40px;
              margin-top: 12px;
              margin-bottom: 12px;
            }
            .batas {
              margin-top: 10px;
              margin-bottom: 10px;
            }
          </style>
        </head>
        <body>
          <div class="header">
            <img src="https://bosgilakademi.com/logoBosgil.jpg" alt="Logo" style="width: 260px; height: auto; margin-top:5px"/>
            <div class="title" style="margin-top:20px; font-weight:500;">${outlet}</div>
            <div class="title" style="margin-top:10px; font-weight:500;">${storeAddress}</div>
              <div class="info" style="margin-top:10px;">Admin: ${phoneNumber}</div>
            </div>
            <div class="underline" style="margin-top:10px;"></div>
            <div class="receipt-body">
              <div class="info" style="margin-top:5px;">Tanggal : ${formatTanggal(
                order.date
              )}</div>
              <div class="info" style="margin-top:5px;">DIbuat Jam ${formatTime(
                order.date
              )}</div>
              <div class="info" style="margin-top:5px;">Kasir : ${
                order.cashier_name
              }</div>

              <div class="info" style="margin-top:5px;">No.TRX : ${
                order.id
              }${formatDateStruk(order.date)}</div>

              <div class="info" style="margin-top:5px;">Orderan Buat : ${formatTanggal(
                order.orderanBuat
              )}</div>
              <div class="info" style="margin-top:5px;">${
                order.pengambilan === "diambil" ? `Diambil Jam` : `Dikirim Jam`
              } ${adjustTimeDeliver(order.timeDeliver)}</div>

              <div class="info" style="margin-top:5px;">Nama Cust : ${
                order.name
              }</div>

             <div class="info" style="margin-top:5px;">No. Telp : 0${
               String(order.nophone).startsWith("62")
                 ? String(order.nophone).slice(2)
                 : order.nophone
             }</div>

              <div class="info" style="margin-top:5px;"">Alamat : ${
                order.alamat
              }</div>

              <div class="batas"></div>
              <div class="underline"></div>
              <div class="batas">
              
              <div class="info-row" style="margin-top:5px;">
                <div class="info"w style="text-transform:capitalize;">${
                  order.pengambilan
                } ${order.kurir ? `: ${order.kurir}` : ""}</div>
              </div>

              <div class="batas"></div>
              <div class="underline"></div>
              <div class="batas">
              
             ${order.noted ? `
<div class="info">Catatan : ${order.noted}</div>

              <div class="batas"></div>
              <div class="underline"></div>
              <div class="batas">
` : ''}
            </div>
              <div class="info">
                ${parsedPesanan
                  .filter(item => !item.namaAqiqah) // Filter out aqiqah data from menu display
                  .map(
                    (item) => `
                      <div class="info">
                        ${item.menu}
                      </div>
                      <div class="info-row" style="margin-top:2px; margin-bottom:5px;">
                        <div class="info">
                          ${item.jumlah} X ${formatHarga(
                      parseFloat(item.hargasatuan)
                    )}
                        </div>

                        <div class="info" style="padding-right:1px;">
                          Rp. ${formatHarga(
                            parseFloat(item.hargasatuan) * item.jumlah
                          )}
                        </div>  
                      </div>
                      <div class="info-catatan">
                        ${item.catatan && `Note: ${item.catatan}`}
                      </div>
                    `
                  )
                  .join("")}
              </div>

              ${parsedPesanan.some(item => item.namaAqiqah) ? `
              <div class="batas"></div>
              <div class="underline"></div>
              <div class="batas"></div>
              
              <div class="info" style="color: #B91C1C; font-weight: bold;">DATA AQIQAH</div>
              
              <div class="info">
                <div class="info">Nama yang di aqiqah: ${parsedPesanan.find(item => item.namaAqiqah)?.namaAqiqah || '-'}</div>
                <div class="info">Jenis Kelamin: ${parsedPesanan.find(item => item.namaAqiqah)?.jenisKelamin || '-'}</div>
                <div class="info">Nama Ayah: ${parsedPesanan.find(item => item.namaAqiqah)?.namaAyah || '-'}</div>
                <div class="info">Nama Ibu: ${parsedPesanan.find(item => item.namaAqiqah)?.namaIbu || '-'}</div>
                <div class="info">Anak ke: ${parsedPesanan.find(item => item.namaAqiqah)?.anakKe || '-'}</div>
                <div class="info">Tempat & Tanggal Lahir: ${parsedPesanan.find(item => item.namaAqiqah)?.tempatTanggalLahir || '-'}</div>
              </div>
              ` : ''}
            <div class="batas"></div>
            <div class="underline"></div>
            <div class="batas"></div>

            <div class="info-row">
              <div class="info">Sub Total :</div>
              <div class="info-row-format">
                <div class="info">Rp.</div>
                <div class="info">${formatHarga(order.normalprice)}</div>
              </div>
            </div>
            
            <div class="info-row">
              <div class="info">Biaya Ongkir :</div>
              <div class="info-row-format">
                <div class="info">Rp.</div>
                <div class="info">${formatHarga(order.ongkir)}</div>
              </div>
            </div>
            <div class="info-row">
              <div class="info">Total :</div>
              <div class="info-row-format">
                <div class="info">Rp.</div>
                <div class="info">${formatHarga(order.price)}</div>
              </div>
            </div>

            <div class="batas"></div>
            <div class="underline"></div>
            <div class="batas"></div>

            <div class="info-row">
              <div class="info">DP - ${
                order.bank === "CASH" ? order.bank : `${order.bank}`
              } :</div>
              <div class="info-row-format">
                <div class="info">Rp.</div>
                <div class="info">${formatHarga(order.dp)}</div>
              </div>
            </div>
            ${
              order.sisa !== 0
                ? `
              <div class="info-row">
                <div class="info">Sisa Pembayaran :</div>
                <div class="info-row-format">
                  <div class="info">Rp.</div>
                  <div class="info">${formatHarga(order.sisa)}</div>
                </div>
              </div>
            `
                : ""
            }
            

            <div class="info-row">
              <div class="info">Pembayaran ${
                order.banklunas === "CASH" ? order.banklunas : order.banklunas
              } :</div>
              <div class="info-row-format">
                <div class="info">Rp.</div>
                <div class="info">${formatHarga(order.pay)}</div>
              </div>
            </div>          
            <div class="info-row">
              <div class="info">Kembalian :</div>
              <div class="info-row-format">
                <div class="info">Rp.</div>
                <div class="info">
                  ${formatHarga(
                    order.pay - (order.sisa === 0 ? order.price : order.sisa)
                  )}
                </div>
              </div>
            </div>
          </div>

          <div class="batas"></div>
          <div class="underline"></div>
          <div class="batas"></div>
          <div class="batas"></div>

          <div class="thanks" style="margin-top:20px;">#KITAPASTIBISA</div>
          <div class="thanks" style="margin-top:10px;">#MAKANANSEGALAACARA</div>
          <div class="thanks">Instagram : @bosgildahsyat</div>
          <div class="thanks">Tiktok : @bosgildahsyat</div>
          <div style="display:flex; justify-content:center;">
          <img src="https://bosgilakademi.com/QR.jpg" alt="qr" style="width: 160px; height: auto; margin-top:10px"/>
          </div>
          <div class="thanks" style="margin-top:10px;">Terima Kasih</div>
        </body>
      </html>
    `;
};

module.exports = { strukPemesananPagesangan };