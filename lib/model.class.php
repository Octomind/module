<?php

class Model{

    protected $db;

    public function __construct(){
        $this->db = App::$db;
    }

	public function getPromo($id=null){
        if (!$id) {
            $sql = "SELECT * from promotion where is_active=1 order by cnt desc ";
            $results=$this->db->query($sql);
            $cnt_click=2;
            $top_clicks=(array_slice($results,0,$cnt_click));
            $another=(array_slice($results,$cnt_click));
            shuffle($another);
            $cnt_another=6;
            $another=(array_slice($another,0,$cnt_another));
            $replace=($cnt_click+$cnt_another)/2;
            $result=array_merge($top_clicks,$another);
            list($result[1], $result[$replace]) = array($result[$replace], $result[1]);
            return $result;
        }else{
            $sql ="UPDATE promotion set cnt=cnt+1 where id={$id}";
            return $this->db->query($sql);
        }
    }
    public function getColor(){
        $sql="select * from color";
        return $this->db->query($sql);
    }
	
}