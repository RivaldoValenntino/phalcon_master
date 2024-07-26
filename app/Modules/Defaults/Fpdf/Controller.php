<?php

declare(strict_types=1);

namespace App\Modules\Defaults\Fpdf;

use App\Libraries\Log;
use App\Modules\Defaults\Datatables\Model;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use setasign\Fpdi\Fpdi;
use Fpdf\Fpdf;




class MyPDF extends Fpdf
{
    // Page header
    function Header()
    {
        // Arial bold 15
        $this->SetFont('Arial', 'B', 15);
        // Move to the right
        $this->Cell(80);
        // Title
        $this->Cell(30, 10, 'Data Pelanggan', 0, 0, 'C');
        // Line break
        $this->Ln(20);
    }

    // Page footer
    function Footer()
    {
        // Position at 1.5 cm from bottom
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}
/**
 * @routeGroup("/fpdf")
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
     * @routeGet("/cdata")
     */
    public function dataAction()
    {
        $users = Model::find();
        echo json_encode($users->toArray());
    }
    /**
     * @routeGet("/cetak")
     */
    public function generateAction()
    {

        $pelanggan = Model::find();

        $pdf = new MyPDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial', 'B', 12);

        $widths = [10, 40, 60, 40];
        $totalWidth = array_sum($widths);

        $pdf->SetX(($pdf->GetPageWidth() - $totalWidth) / 2);
        $pdf->SetFillColor(200, 200, 200);
        $pdf->Cell($widths[0], 10, '#', 1, 0, 'C', true);
        $pdf->Cell($widths[1], 10, 'Nama Pelanggan', 1, 0, 'C', true);
        $pdf->Cell($widths[2], 10, 'Alamat', 1, 0, 'C', true);
        $pdf->Cell($widths[3], 10, 'Nomor Telepon', 1, 1, 'C', true);

        $no = 1;
        $fill = false;
        foreach ($pelanggan as $p) {
            $pdf->SetX(($pdf->GetPageWidth() - $totalWidth) / 2);
            $pdf->SetFillColor(230, 230, 230);
            $pdf->Cell(10, 10, $no++, 1, 0, 'C', $fill);
            $pdf->Cell(40, 10, $p->nama_pelanggan, 1, 0, 'L', $fill);
            $pdf->Cell(60, 10, $p->alamat, 1, 0, 'L', $fill);
            $pdf->Cell(40, 10, $p->no_hp, 1, 1, 'L', $fill);

            $fill = !$fill;
        }

        $pdf->Output('D', 'pelanggan.pdf', true);
    }
}