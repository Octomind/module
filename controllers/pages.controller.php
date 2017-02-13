<?php

class PagesController extends Controller{

    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new Page();
    }

    public function index(){
        $this->data['pages'] = $this->model->getList();
    }

    public function view(){
		App::$nav = $this->model->getCategories();
        $params = App::getRouter()->getParams();

        if ( isset($params[0]) ){
            $id = strtolower($params[0]);
            $this->data['page'] = $this->model->getById($id);
			$this->model=new Comment();
            $this->data['comments']=$this->model->get_comments($id);
            /* if( isset($_POST['comment']) && !empty($_POST['comment'])){
                $this->data['comments']=$this->model->add_comment(Session::get('login'),$id,$_POST['comment'],$_POST['id_parent']);
                Router::redirect("/pages/view/{$id}");
            } */
        }
    }

    public function admin_index(){
        $this->data['pages'] = $this->model->getList();
    }
	
    public function admin_add(){
        if ( $_POST ){
            $result = $this->model->save($_POST);
            if ( $result ){
                Session::setFlash('Page was saved.');
            } else {
                Session::setFlash('Error.');
            }
            // Router::redirect('/admin/pages/');
        }
		$this->data['categories'] = $this->model->getCategory();
		$this->data['tags'] = $this->model->getTags();
    }

    public function admin_edit(){

        if ( $_POST ){
            $id = isset($_POST['id']) ? $_POST['id'] : null;
            $result = $this->model->save($_POST, $id);
            if ( $result ){
                Session::setFlash('Page was saved.');
            } else {
                Session::setFlash('Error.');
            }
			
/*             Router::redirect('/admin/pages/');
 */        }

        if ( isset($this->params[0]) ){
            $this->data['page'] = $this->model->getById($this->params[0]);
			$this->data['categories'] = $this->model->getCategory();
			$this->data['tags'] = $this->model->getTags();
        } else {
            Session::setFlash('Wrong page id.');
            Router::redirect('/admin/pages/');
        }
    }

    public function admin_delete(){
        if ( isset($this->params[0]) ){
            $result = $this->model->delete($this->params[0]);
            if ( $result ){
                Session::setFlash('Page was deleted.');
            } else {
                Session::setFlash('Error.');
            }
        }
        Router::redirect('/admin/pages/');
    }

}