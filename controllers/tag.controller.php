<?php
class TagController extends Controller{

    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new Tagg();
    }
	
	public function search(){
        $search = $_POST['search'];
        $search = addslashes($search);
        $search = htmlspecialchars($search);
        $search = stripslashes($search);
        $tags = $this->model->search($search);
        for ($i = 0; $i < count($tags); $i++) {
            echo "<li><a href=/tag/view/{$tags[$i]['id_tag']}>" . $tags[$i]['tag_name'] . "</a></li>";
        }
        exit;
    }
	
	public function view(){
		$params = App::getRouter()->getParams();
        if ( isset($params[0])){
            $id = strtolower($params[0]);
            $this->data['news'] = $this->model->getByTag($id);
            $this->data['tag'] = $this->model->getTag($id);
        }
        
    }
	
    public function admin_index(){
        $this->data['tags'] = $this->model->getTags();
    }
	
	public function admin_add(){
        if ( $_POST ){
            $result = $this->model->saveTag($_POST);
            
            Router::redirect('/admin/tag/');
        }
    }
	
	public function admin_delete(){
        if ( isset($this->params[0]) ){
            $result = $this->model->deleteTag($this->params[0]);
			
        Router::redirect('/admin/tag/');
		}
    }
	
}