<?php
class Promo extends Model{

    public function getPromo(){
        $sql="select * from promotion";
        $result=$this->db->query($sql);
        return $result;
    }
    public function delPromo($id){
        $sql="delete from promotion where id={$id}";
        $this->db->query($sql);
    }
    public function savePromo($data,$id=null){
        $id = (int)$id;
        $name=$data['name'];
        $price=$data['price'];
        $is_active=isset($data['is_active'])? 1 :0;
        if ($id){
            $sql="update promotion set
                                 product_name='{$name}',
                                 price='{$price}',
                                 is_active='{$is_active}'
                                 where id={$id}";
        }else{
            $sql="insert into  promotion set
                                 product_name='{$name}',
                                 price='{$price}',
                                 cnt=0,
                                 is_active='{$is_active}'";
        }
        $this->db->query($sql);
    }
    public function byId($id){
        $sql="select * from promotion where id={$id}";
        return $this->db->query($sql);
    }
   
}