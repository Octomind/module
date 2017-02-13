<?php
class FilterController extends Controller
{
    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new Filt();
    }
	
    public function index(){
        $this->data['tags'] = $this->model->getTags();
        $this->data['categories'] = $this->model->getCategories();
        if (!empty($_POST)) {
            $this->data['news'] = $this->model->getNews($_POST);
        }
    }
}