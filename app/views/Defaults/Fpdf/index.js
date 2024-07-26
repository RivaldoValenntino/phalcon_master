window.defaultUrl = `${baseUrl}fpdf`;
document.getElementById("downloadBtn").addEventListener("click", function () {
  window.location.href = defaultUrl + "/cetak";
});
