<?php

class CategoriesController extends Controller{

    public function __construct(){
        parent::__construct();
        $this->model = new Cat();
		App::$nav = $this->model->getCategories();
    }

    public function index(){
        $this->data = $this->model->getCategories();
		$this->model = new Comment();
		$this->data['users']=$this->model->topUsers();
        $this->data['news']=$this->model->topNews();
    }

    public function view(){
		$params = App::getRouter()->getParams();

        if ( isset($params[0]) ){
            $id = strtolower($params[0]);
            $this->data = $this->model->getNews($id);
        }
        
    }
	
	public function admin_index(){
        $this->data = $this->model->getCategories();
		
    }
	
	public function admin_add(){
        if ( $_POST ){
            $result = $this->model->save($_POST);
            if ( $result ){
                Session::setFlash('Category was saved.');
            } else {
                Session::setFlash('Error.');
            }
            Router::redirect('/admin/categories/');
        }
    }

    public function admin_edit(){

        if ( $_POST ){
            $id = isset($_POST['id']) ? $_POST['id'] : null;
            $result = $this->model->save($_POST, $id);
            if ( $result ){
                Session::setFlash('Category was saved.');
            } else {
                Session::setFlash('Error.');
            }
            Router::redirect('/admin/categories/');
        }

        if ( isset($this->params[0]) ){
            $this->data['category'] = $this->model->getById($this->params[0]);
        } else {
            Session::setFlash('Wrong category id.');
            Router::redirect('/admin/categories/');
        }
    }
	
	public function admin_delete(){
        if ( isset($this->params[0]) ){
            $result = $this->model->delete($this->params[0]);
            if ( $result ){
                Session::setFlash('Category was deleted.');
            } else {
                Session::setFlash('Error.');
            }
        }
        Router::redirect('/admin/categories/');
    }
}