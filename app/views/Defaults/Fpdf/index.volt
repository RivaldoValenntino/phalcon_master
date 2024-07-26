{% extends 'template/dashboard.volt' %} {% block title %}FPDF {% endblock %} {%
block content %}
<style>
  .select2-container--bootstrap4 .select2-selection--single {
    height: calc(3em) !important;
  }
  /* CSS */
  .price {
    float: right;
  }
</style>
<div class="page-content">
  <h1>FPDF</h1>
  <button class="btn btn-primary" id="downloadBtn">Export to PDF</button>
</div>

{% endblock %} {% block inline_script %}
<script>
  {% include 'Defaults/Fpdf/index.js' %}
</script>
{% endblock %}
