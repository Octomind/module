<?php

class Cat extends Model{
	
	public function getById($id){
        $id = (int)$id;
        $sql = "select * from categories where id = '{$id}' limit 1";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result[0] : null;
    }

    public function getCategories(){
		$data = array();
        $sql='SELECT * FROM categories';
        $categories = $this->db->query($sql);
		$data['categories'] = $categories;
        
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
	
	public function delete($id){
        $id = (int)$id;
        $sql = "delete from categories where id = {$id}";
        return $this->db->query($sql);
    }
	
	
	
    public function save($data, $id = null){
        if ( !isset($data['name'])){
            return false;
        }

        
        $name = $this->db->escape($data['name']);

        if ( $id===null ){ // Add new record
            $sql = "
                insert into categories
                   set name = '{$name}'
            ";
        } else { // Update existing record
            $sql = "
                update categories
                   set name = '{$name}'         
                   where id = {$id}
            ";
        }

        return $this->db->query($sql);
    }
}