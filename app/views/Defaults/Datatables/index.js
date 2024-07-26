window.defaultUrl = `${baseUrl}/datatables/`;
var table;
// console.log(defaultUrl);

function getDatatables() {
  table = $("#datatable").DataTable({
    ajax: {
      url: defaultUrl + "datatable",
      type: "post",
      data: function (d) {
        var formData = $("#form-filter").serializeArray();
        $.each(formData, function (key, val) {
          d[val.name] = val.value;
        });
      },
    },
    serverSide: true,
    processing: true,
    responsive: true,
    selected: false,
    aaSorting: [],
    columnDefs: [
      {
        searchable: false,
        targets: [0],
      },
    ],
    columns: [
      {
        data: "id_pelanggan",
        orderable: false,
        render: function (data, index, row, meta) {
          return meta.row + meta.settings._iDisplayStart + 1 + ".";
        },
      },
      {
        data: "nama_pelanggan",
      },
      {
        data: "alamat",
      },
      {
        data: "no_hp",
      },
      {
        data: "kategori_laporan",
      },
    ],
  });
}

function resetErrors() {
  $(".form-control").each(function (i, el) {
    $(el).removeClass("brc-danger-m2");
    $(el).next().text("").hide();
    $(el).prev().removeClass("text-danger-d1");
  });
}

$(document).ready(function () {
  getDatatables();

  $("#btn-refresh-data").click(function () {
    $("#filterModal").find("input[type=checkbox]").prop("checked", false);
    $("input[name=search_nama_pelanggan]").val("");
    $("input[name=search_alamat]").prop("disabled", true);
    table.ajax.reload();
  });

  $("#btn-search").click(function () {
    $("#filterModal").modal("show");
  });

  $(".select2kategori").select2({
    allowClear: true,
    theme: "bootstrap4",
    width: "auto",
  });
  let modal = $("#formModal");
  $("#btn-add").click(function () {
    modal.find("input[name=nama_pelanggan]").val("");
    modal.find("input[name=alamat]").val("");
    modal.find("input[name=no_hp]").val("");
    modal.find("select[name=kategori_laporan]").val("").trigger("change");
    resetErrors();
    $("#formModal").modal("show");
  });

  modal.find("form").on("submit", function (ev) {
    ev.preventDefault();

    let submitButton = $(this).find("[type=submit]");
    let originalContent = submitButton.html();
    submitButton.html('<i class="fa fa-spin fa-spinner"></i> Menyimpan...');
    submitButton.prop("disabled", true);
    let type = $("[name=_type]").val();
    let id = $("[name=id]").val();
    let url = type == "create" ? defaultUrl + "/store" : defaultUrl + "/update";

    $.post(url, $(this).serialize())
      .done(function (response) {
        Swal.fire({
          title: "Sukses",
          text: "Data berhasil disimpan",
          icon: "success",
        });
        modal.modal("hide");
        table.ajax.reload();
        console.log(response);
      })
      .fail(function (jqXHR) {
        if (jqXHR && jqXHR.responseJSON && jqXHR.responseJSON.errors) {
          let errors = jqXHR.responseJSON.errors;
          for (let field in errors) {
            let el = $(`[name=${field}]`);
            el.toggleClass("brc-danger-m2");
            el.next().text(errors[field]).show();
            el.prev().toggleClass("text-danger-d1");
          }
        }
      })
      .always(function () {
        submitButton.html(originalContent);
        submitButton.prop("disabled", false);
      });
  });
});
