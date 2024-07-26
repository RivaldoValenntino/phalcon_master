 document.addEventListener('DOMContentLoaded', function() {
    const data = <?= json_encode($data); ?>;
    const container = document.querySelector('#HandsonTable');
    const table = new Handsontable(container, {
      data: data.map((val) => {
        return [val.nama_pelanggan, val.no_hp, val.alamat, val.kategori_laporan];
      }),
      colHeaders: true,
      rowHeaders: true,
      width: '100%',
      height: 'auto',
      multiColumnSorting: true,
      filters: true,
      autoWrapRow: true,
      autoWrapCol: true,
      manualRowMove: true,
      stretchH: 'all',
      licenseKey: 'non-commercial-and-evaluation'
    });
  });