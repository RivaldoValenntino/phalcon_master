{% extends 'template/dashboard.volt' %} {% block title %} PhpSpreadsheet {%
endblock %} {% block content %}
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
  <div class="container">
    <h1>Export Data Pelanggan to Spreadsheet</h1>
    <button class="btn btn-primary" id="btn-excel">Export</button>
  </div>
</div>
{% endblock %} {% block inline_script %}
<script>
  {% include 'Defaults/Phpspreadsheet/index.js' %}
</script>
{% endblock %}
