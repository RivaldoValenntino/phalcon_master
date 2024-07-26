$(document).ready(function () {
  $("#summernote").summernote({
    height: 200,
    width: "100%",
  });
  $(".datepicker-month").datepicker({
    format: "mm/dd",
    startView: 1, // Start view as months
    maxViewMode: 1, // Only show months and days
    todayHighlight: true,
    autoclose: true,
  });
  $(".datepicker-year").datepicker({
    format: "yyyy",
    startView: 2, // Start view as years
    minViewMode: 2, // Only show years
    todayHighlight: true,
    autoclose: true,
  });
  $("#jenis_pengaduan").select2({
    allowClear: true,
    theme: "bootstrap4",
    width: "auto",
  });
});
