<?php

declare(strict_types=1);

namespace App\Modules\Defaults\Summernote;

use App\Libraries\Log;
use Phalcon\Mvc\Controller as BaseController;

/**
 * @routeGroup("/summernote")
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
}
