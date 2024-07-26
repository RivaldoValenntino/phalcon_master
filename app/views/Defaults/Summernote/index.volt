{% extends 'template/dashboard.volt' %} {% block title %} WYISIG {% endblock %}
{% block content %}
<style>
  .select2-container--bootstrap4 .select2-selection--single {
    height: calc(3em) !important;
  }
  /* CSS */
  .border-top-4 {
    border-top: 4px solid #0d6efd;
  }
  .border-bottom-4 {
    border-bottom: 4px solid #0d6efd;
  }
  .note-editor {
    background-color: #f4f4f4;
    border: 1px solid #ddd;
  }

  .note-toolbar .note-btn {
    color: #fff !important;
  }

  .note-editable {
    background-color: #fff;
    color: #333;
  }
</style>
<div class="page-content">
  <div
    class="container shadow-md rounded-lg border-top-4"
    style="background-color: #f5f5f5"
  >
    <div
      class="container shadow-md w-75 mt-5 p-2"
      style="background-color: #ffffff"
    >
      <div
        class="container shadow-md mb-4 rounded-lg p-2 border-top-4"
        style="background-color: #ffffff"
      >
        <div class="card-header">
          <h4>Kriteria Pelanggan</h4>
        </div>
        <div class="card-body">
          <label class="input-group-text">Prioritas Pelanggan</label>
          <form class="mt-2">
            <div class="card">
              <div class="card-body">
                <div class="form-group row mx-auto">
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="prioritasPelanggan"
                      id="pelangganPDAM"
                      checked
                    />
                    <label class="form-check-label" for="pelangganPDAM">
                      Pelanggan PDAM
                    </label>
                  </div>
                  <div class="form-check mx-5">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="prioritasPelanggan"
                      id="bukanPelangganPDAM"
                    />
                    <label class="form-check-label" for="bukanPelangganPDAM">
                      Bukan Pelanggan PDAM
                    </label>
                  </div>
                </div>
                <!-- <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01"
                      >Jenis Pengaduan</label
                    >
                  </div>
                  <select class="custom-select" id="inputGroupSelect01">
                    <option selected>Choose...</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>
                </div> -->
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Tanggal Keluhan</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control datepicker-month"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Tahun Keluhan</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control datepicker-year"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Jenis Pengaduan</span
                    >
                  </div>
                  <select name="jenis_pengaduan" id="jenis_pengaduan">
                    <option value="umum">Umum</option>
                    <option value="khusus">Khusus</option>
                    <option value="spesifik">Spesifik</option>
                    <option value="permasalahan">Permasalahan</option>
                    <option value="kecelakaan">Kecelakaan</option>
                    <option value="kecelakaan">Lainnya</option>
                  </select>
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Deskripsi</span
                    >
                  </div>
                  <div id="summernote"></div>
                </div>
              </div>
            </div>
            <div class="card border-top-4 mt-3">
              <div class="card-header">
                <h4>Biodata Pelanggan</h4>
              </div>
              <div class="card-body">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Nama Pelapor</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Nomor Pelanggan</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Nama Pelanggan</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Tanggal Lahir</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Email</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-default"
                      >Nomor Telepon</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
              </div>
            </div>
            <div class="card border-top-4 mt-5 mb-4">
              <div class="card-header">
                <h4>Detail Pengaduan</h4>
              </div>
              <div class="card-body">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text text-sm"
                      id="inputGroup-sizing-default"
                      >Cabang Lokasi Pengaduan</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text text-sm"
                      id="inputGroup-sizing-default"
                      >Alamat Detail Pengaduan</span
                    >
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-sm"
                  />
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text text-sm"
                      id="inputGroup-sizing-default"
                      >Keterangan Pengaduan</span
                    >
                  </div>
                  <textarea name="" id="" class="form-control"></textarea>
                </div>
                <div class="input-group input-group-lg mb-3 position-relative">
                  <div class="input-group-prepend">
                    <span
                      class="input-group-text"
                      id="inputGroup-sizing-lg"
                      style="width: 930px"
                      >Lokasi</span
                    >
                    <input
                      type="text"
                      class="position-absolute p-2"
                      aria-label="Small"
                      placeholder="Cari Lokasi"
                      style="right: 20px; top: 2px"
                    />
                  </div>
                </div>
                <iframe
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.576948863881!2d107.61299747488643!3d-6.941055893058995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68e88f33310855%3A0x5a74507f4b84ed25!2sJl.%20Srisuci%2C%20Ancol%2C%20Kec.%20Regol%2C%20Kota%20Bandung%2C%20Jawa%20Barat%2040254!5e0!3m2!1sid!2sid!4v1721105399830!5m2!1sid!2sid"
                  width="600"
                  height="450"
                  style="border: 0"
                  allowfullscreen=""
                  loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"
                ></iframe>
              </div>
            </div>
            <div class="mt-1 w-100 py-3 px-2">
              <button class="btn btn-primary w-100" type="submit">
                Submit
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
{% endblock %} {% block inline_script %}
<script>
  {% include 'Defaults/Summernote/index.js' %}
</script>
{% endblock %}
