{% extends 'template/dashboard.volt' %} {% block title %} HandsonTable {%
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
  <div
    class="container shadow-md rounded-lg border-top-4"
    style="background-color: #f5f5f5"
  >
    <h1 class="p-3">Handsontable</h1>
    <div
      class="d-flex container shadow-md rounded-lg border-top-4 w-75 p-3"
      style="background-color: #ffffff"
    >
      <div id="HandsonTable"></div>
    </div>
  </div>
</div>
{% endblock %} {% block inline_script %}
<script>
  {% include 'Defaults/Handsontable/index.js' %}
</script>
{% endblock %}
