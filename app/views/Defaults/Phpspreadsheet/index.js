const buttonExcel = document.getElementById("btn-excel");
window.defaultUrl = `${baseUrl}phpspreadsheet`;
buttonExcel.addEventListener("click", function () {
  window.location.href = defaultUrl + "/generate";
});
