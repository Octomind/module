<?php

class Color extends Model {

    public function save($id,$color){
        $id=(int)$id;
        $sql="update color set `value`='{$color}' where id={$id}";
        $this->db->query($sql);
    }

	public function getColor(){
        $sql="select * from color";
        return $this->db->query($sql);
    }
}