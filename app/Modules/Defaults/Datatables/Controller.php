<?php

declare(strict_types=1);

namespace App\Modules\Defaults\Datatables;

use App\Libraries\Log;
use App\Modules\Defaults\Datatables\Model as DatatablesModel;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;
use App\Modules\Defaults\Master\ReferensiBarang\Barang\Model as Model;

/**
 * @routeGroup("/datatables")
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
     * @routeGet("/detail")
     */
    public function detailAction()
    {
    }

    /**
     * @routePost("/store")
     */
    public function storeAction()
    {
        $data = [
            'nama_pelanggan' => Request::getPost('nama_pelanggan'),
            'alamat' => Request::getPost('alamat'),
            'no_hp' => Request::getPost('no_hp'),
            'kategori_laporan'  => Request::getPost('kategori_laporan'),
        ];


        $model = new DatatablesModel($data);

        $model->save();

        return Response::setJsonContent([
            'message' => 'Success',
        ]);
    }

    /**
     * @routeGet("/test") 
     */
    public function testAction()
    {
        return 'Oksodk';
    }

    /**
     * @routePost("/update")
     */
    public function updateAction()
    {
    }

    /**
     * @routePost("/delete")
     */
    public function deleteAction()
    {
    }
    /**
     * @routeGet("/datatable")
     * @routePost("/datatable")
     */
    public function datatableAction()
    {
        $search_nama_pelanggan = Request::getPost('search_nama_pelanggan');
        $search_alamat = Request::getPost('search_alamat');

        $builder = $this->modelsManager->createBuilder()
            ->columns('*')
            ->from(DatatablesModel::class)
            ->where("1=1");

        if ($search_nama_pelanggan) {
            $builder->andWhere("nama_pelanggan LIKE '%$search_nama_pelanggan%'");
        }
        if ($search_alamat) {
            $builder->andWhere("alamat LIKE '%$search_alamat%'");
        }



        $dataTables = new DataTable();
        $dataTables->fromBuilder($builder)->sendResponse();
    }
    // public function dataTablesAction()
    // {
    //     $columns = [
    //         'id_pelanggan',
    //         'nama_pelanggan',
    //         'alamat',
    //         'no_hp',
    //         'kategori_laporan',
    //         'created_at'
    //     ];

    //     $orderParam = $this->request->getQuery('order', null, []);
    //     $orderBy = 'id_pelanggan ASC'; // Default order by

    //     if (!empty($orderParam) && isset($orderParam[0]['column']) && isset($columns[$orderParam[0]['column']])) {
    //         $orderBy = $columns[$orderParam[0]['column']] . ' ' . $orderParam[0]['dir'];
    //     }

    //     $limit = (int) $this->request->getQuery('length', 'int', 10);
    //     $offset = (int) $this->request->getQuery('start', 'int', 0);
    //     $searchValue = $this->request->getQuery('search')['value'];

    //     $conditions = [];
    //     $bind = [];

    //     if (!empty($searchValue)) {
    //         foreach ($columns as $column) {
    //             $conditions[] = "$column LIKE :searchValue:";
    //         }
    //         $bind['searchValue'] = '%' . $searchValue . '%';
    //     }

    //     $conditionString = implode(' OR ', $conditions);

    //     $data = DatatablesModel::find([
    //         'conditions' => $conditionString,
    //         'bind' => $bind,
    //         'order' => $orderBy,
    //         'limit' => $limit,
    //         'offset' => $offset
    //     ]);

    //     $totalData = DatatablesModel::count();
    //     $totalFiltered = DatatablesModel::count([
    //         'conditions' => $conditionString,
    //         'bind' => $bind
    //     ]);

    //     $jsonData = [
    //         'draw' => (int) $this->request->getQuery('draw', 'int', 0),
    //         'recordsTotal' => $totalData,
    //         'recordsFiltered' => $totalFiltered,
    //         'data' => $data->toArray()
    //     ];

    //     return $this->response->setJsonContent($jsonData);
    // }
}