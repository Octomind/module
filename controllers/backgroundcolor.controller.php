<?php
class BackgroundcolorController extends Controller{
 
    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new Color();
    }
    public function admin_index(){
        if ($_POST){
            $id=key($_POST);
            $color=$_POST[$id];
            $this->model->save($id,$color);
            Router::redirect('/admin/backgroundcolor/');
        }else{
            $this->data['bg_site'] = $this->model->getColor();
        }
    }

}