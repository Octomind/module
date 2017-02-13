<?php

class Cat extends Model{

    public function getCategories(){

        $sql='SELECT * FROM categories';
        $categories = $this->db->query($sql);


        $data = array();

        foreach($categories as $category){
            $id = $category['id'];
            $data['category'][$id] = $category;
            $sql = "SELECT * FROM pages WHERE categories_id = '{$id}' ORDER BY id DESC LIMIT 5";
            $data['category'][$id]['pages'] = $this->db->query($sql);
        }

        $sql = "SELECT * FROM pages ORDER BY id DESC LIMIT 4";
        $data['pages'] = $this->db->query($sql);
        return $data;
    }

    public function getNews($id){
        $data = array();
        $id = $this->db->escape($id);
        $sql = "SELECT * FROM categories WHERE id = '{$id}'";
        $result = $this->db->query($sql);
        $data['category'] = $result[0];
        $sql = "SELECT * FROM pages WHERE categories_id = '{$id}' ORDER BY id DESC";
        $data['pages'] = $this->db->query($sql);
        return $data;
    }
}