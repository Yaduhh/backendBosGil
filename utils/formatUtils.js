const formatDateStruk = (dateString) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  return `${day}${month}${year}TM${hours}${minutes}`;
};

const formatTanggal = (dateString) => {
  const date = new Date(dateString);
  const days = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
  const dayName = days[date.getDay()];
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const timeFormatted = `${hours}:${minutes}`;
  return `${dayName}, ${day}-${month}-${year}`;
};

const formatTime = (dateString) => {
  const date = new Date(dateString);
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const timeFormatted = `${hours}:${minutes}`;
  return `${timeFormatted}`;
};

const formatHarga = (harga) => {
  if (typeof harga === "number") {
    return harga.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  } else {
    return "0";
  }
};

// Export functions using CommonJS
module.exports = {
  formatDateStruk,
  formatTanggal,
  formatTime,
  formatHarga,
};
