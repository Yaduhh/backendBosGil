const { formatTanggal, formatTime, formatDateStruk, formatHarga } = require('../../../utils/formatUtils');

const adjustTimeDeliver = (timeDeliver) => {
  const [hours, minutes] = timeDeliver.split(":").map(Number);
  const date = new Date();
  date.setHours(hours, minutes - 0);
  return date.toTimeString().slice(0, 5);
};

const notaReservasiBintaro = async (order) => {
  const outlet = "BOSGIL BINTARO";
  const storeAddress =
    "Jl. Camat Pd. Aren No.7, Pd. Pucung, Kota Tangerang Selatan Banten 15229.";
  const phoneNumber = "0811-1201-2158";
  const bank_bca = "8841 007 913";
  const nama_bank_bca = "CV. Makanan Segala Acara Bintaro";
  const bank_mandiri = "155-00-14338944";
  const nama_bank_mandiri = "CV. Makanan Segala Acara Bintaro";
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
            .title-reservasi {
              font-size: 40px;
              font-weight: bold,
              color:#000;
            }
            .sub-title {
              font-size: 20px;
              font-weight: 400,
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
          <div class="title-reservasi" style="margin-top:20px; margin-bottom:10px font-weight:bold;">NOTA RESERVASI</div>
            <img src="https://bosgilakademi.com/logoBosgil.jpg" alt="Logo" style="width: 260px; height: auto; margin-top:15px"/>
            <div class="title" style="margin-top:10px; font-weight:500;">${outlet}</div>
            <div class="sub-title" style="margin-top:10px; font-weight:500;">${storeAddress}</div>
              <div class="info" style="margin-top:10px;">Admin ${"     "}: ${phoneNumber}</div>
            </div>
            <div class="underline" style="margin-top:10px;"></div>
            <div class="receipt-body">
              <div class="info" style="margin-top:5px;">Tanggal : ${formatTanggal(
                order.date
              )}</div>
              <div class="info" style="margin-top:5px;">Dibuat Jam ${formatTime(
                order.date
              )}</div>
              <div class="info" style="margin-top:5px;">Kasir : ${
                order.cashier_name
              }</div>

              <div class="info" style="margin-top:5px;">No.TRX : ${
                order.id
              }${formatDateStruk(order.date)}</div>

              <div class="info" style="margin-top:5px;">
              Nama Cust : <b>${order.name}</b>
              </div>
              
              <div class="info" style="margin-top:5px;">
              No. Telp : <b>0${
              String(order.nophone).startsWith("62")
              ? String(order.nophone).slice(2)
              : order.nophone
                  
              }</b>
              </div>

              <div class="batas"></div>
              <div class="underline"></div>
              <div class="batas">
              
              <div class="info" style="margin-top:5px;">
              Table : <b>${order.vip}</b>
              </div>
              
              <div class="info" style="margin-top:5px;">
              Jumlah Tamu : <b>${order.jumlah_orang} Orang</b>
              </div>
              
              <div class="info" style="margin-top:5px;">
              Reservasi Buat : <b>${formatTanggal(order.orderanBuat)}</b>
              </div>
              
              <div class="info" style="margin-top:5px;">
              Waktu Reservasi : <b>${adjustTimeDeliver(order.from_jam)} -   ${adjustTimeDeliver(order.until_jam)}</b>
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
            <div class="batas"></div>
            <div class="underline"></div>
            <div class="batas"></div>
            
            <div class="info-row">
              <div class="info">Total :</div>
              <div class="info-row-format">
                <div class="info">Rp.</div>
                <div class="info">${formatHarga(order.price)}</div>
              </div>
            </div>           

            <div>
                ${
                  order.dp === 0
                    ? ""
                    : `
                      <div class="batas"></div>
                      <div class="underline"></div>
                      <div class="batas"></div>
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
                      <div class="info-row">
                        <div class="info">Sisa :</div>
                        <div class="info-row-format">
                          <div class="info">Rp.</div>
                          <div class="info">${formatHarga(order.sisa)}</div>
                        </div>
                      </div>
                    `
                }
            </div>

            <div class="batas"></div>
            <div class="underline"></div>
            <div class="batas"></div>
            <div class="batas"></div>
            
            <div class="info">
              <div class="info">
                BANK BCA
              </div>
              <div class="info" style="margin-top:5px;">
                No Rek : ${bank_bca} 
              </div>
              <div class="info" style="padding-right:1px; margin-top:5px;">
                 ${nama_bank_bca}
              </div>  
            </div>          
            <div class="info" style="margin-top:10px;">
              <div class="info">
                  BANK MANDIRI
              </div>
              <div class="info" style="margin-top:5px;">
                No Rek : ${bank_mandiri}
              </div>
              <div class="info" style="padding-right:1px; margin-top:5px;">
                ${nama_bank_mandiri}
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

module.exports = { notaReservasiBintaro };