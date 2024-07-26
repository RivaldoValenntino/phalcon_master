<?php

declare(strict_types=1);

namespace App\Modules\Defaults\Handsontable;

use App\Libraries\Log;
use App\Modules\Defaults\Datatables\Model;
use Phalcon\Mvc\Controller as BaseController;

/**
 * @routeGroup("/handsontable")
 */
class Controller extends BaseController
{
    /**
     * @routeGet("/")
     */
    public function indexAction($id)
    {
        $data = Model::find();
        $this->view->data = $data;
        $this->view->setVar('module', $id);
    }
}