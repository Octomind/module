<?php

class Controller{

    protected $data;

    protected $model;

    protected $params;

    /**
     * @return mixed
     */
    public function getData(){
		$mod=new Model();
        $id=isset($_POST['promotion_id']) ? $_POST['promotion_id']  : null;
		App::$dat['promo'] =$mod->getPromo($id);
        App::$dat['color']=$mod->getColor();
        return $this->data;
    }

    /**
     * @return mixed
     */
    public function getModel(){
        return $this->model;
    }

    /**
     * @return mixed
     */
    public function getParams(){
        return $this->params;
    }

    public function __construct($data = array()){
        $this->data = $data;
        $this->params = App::getRouter()->getParams();
    }

}