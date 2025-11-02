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

const notaCondet = async (order) => {
  const outlet = "NASI MANDHI BOSGIL CONDET";
  const storeAddress =
    "Jl. RAYA CONDET NO.5 RT.5/RW 6 CILILITAN KRAMAT JATI JAKARTA";
  const phoneNumber = "08119058817";
  const phoneNumber1 = "08119291531";
  const bank_bca = "8840 999 298";
  const nama_bank_bca = "CV. Makanan Segala Acara";
  const bank_mandiri = "155 0013 888 980";
  const nama_bank_mandiri = "CV. Makanan Segala Acara";
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
              width: 38.5%;
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
              <div class="info" style="margin-top:10px;">Admin 1: ${phoneNumber}</div>
              <div class="info">Admin 2: ${phoneNumber1}</div>

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

              <div class="info" style="margin-top:5px;">Orderan Buat : <b>${formatTanggal(
                order.orderanBuat
              )}</b></div>
              <div class="info" style="margin-top:5px;">${
                order.pengambilan === "diambil" ? `Diambil Jam` : `Dikirim Jam`
              } <b>${adjustTimeDeliver(order.timeDeliver)}</b></div>

              <div class="info" style="margin-top:5px;">Nama Cust : <b>${
                order.name
              }</b></div>

              <div class="info" style="margin-top:5px;">No. Telp : <b>0${
                String(order.nophone).startsWith("62")
                  ? String(order.nophone).slice(2)
                  : order.nophone
              }</b></div>
              <div class="info" style="margin-top:5px; text-align:left;">Alamat : ${
                order.alamat
              }</div>

              <div class="batas"></div>
              <div class="underline"></div>
              <div class="batas">
              
              <div class="info-row" style="margin-top:5px;">
                <div class="info"w style="text-transform:capitalize;"><b>${
                  order.pengambilan
                } ${order.kurir ? `: ${order.kurir}` : ""}</b></div>                
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
              
              <div class="info" style="color: #B91C1C; font-weight: bold; text-align: center;">📋 DATA AQIQAH</div>
              
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

module.exports = { notaCondet };