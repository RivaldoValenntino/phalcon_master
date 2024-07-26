<?php

declare(strict_types=1);

namespace App\Modules\Defaults\Phpspreadsheet;

use App\Libraries\Log;
use App\Modules\Defaults\Datatables\Model as DatatablesModel;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;
use App\Modules\Defaults\Master\ReferensiBarang\Barang\Model as Model;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

/**
 * @routeGroup("/phpspreadsheet")
 */
class Controller extends BaseController
{
    /**
     * @routeGet("/")
     */
    public function indexAction($id)
    {
        $this->view->setVar('module', $id);
    }

    /**
     *  @routeGet("/generate")
     */
    public function generateAction()
    {

        // Membuat spreadsheet baru
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Mendapatkan data dari database
        $users = DatatablesModel::find();

        // Menambahkan data ke spreadsheet
        $sheet->setCellValue('A1', 'Nama');
        $sheet->setCellValue('B1', 'Nomor HP');
        $sheet->setCellValue('C1', 'Alamat');

        $row = 2;
        foreach ($users as $user) {
            $sheet->setCellValue('A' . $row, $user->nama_pelanggan);
            $sheet->setCellValue('B' . $row, $user->no_hp);
            $sheet->setCellValue('C' . $row, $user->alamat);
            $row++;
        }

        // Menulis file spreadsheet ke output
        $writer = new Xlsx($spreadsheet);

        // Mengatur header untuk download file
        $filename = 'pelanggan.xlsx';
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $filename . '"');
        header('Cache-Control: max-age=0');

        $writer->save('php://output');

        // Menghentikan eksekusi lebih lanjut
        $this->view->disable();
    }
}