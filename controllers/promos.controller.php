<?php

class PromosController extends Controller
{
    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model = new Promo();
    }

	public function admin_index(){
        $this->data = $this->model->getPromo();
    }
	
	public function admin_edit(){
		if ( $_POST ){
            $id = $_POST['id'];
            $result = $this->model->savePromo($_POST, $id);
			Router::redirect('/admin/promos/');
        }
		$id = $this->params[0];
        $this->data = $this->model->byId($id);
    }
	
	public function admin_add(){
        if ($_POST && !empty($_POST)){$this->data = $this->model->savePromo($_POST);
		Router::redirect('/admin/promos');}
    }
	
	public function admin_delete(){
        $id = $this->params[0];
        $this->model->delPromo($id);
        Router::redirect('/admin/promos');
    }
	
}