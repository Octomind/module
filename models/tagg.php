<?php

class Tagg extends Model{
	
	public function getTags(){
        $sql='SELECT * FROM tags';
        $tags = $this->db->query($sql);
		return $tags;
	}
	
	public function getTag($id){
		$sql = "SELECT tag_name,id_tag FROM tags WHERE id_tag = '{$id}'";
        $result = $this->db->query($sql);
        return $result;
	}
	
	public function getByTag($id){
        $sql = "select p.*,tags.id_tag,tags.tag_name from pages p
                left join tag_news t on t.id_news=p.id
                left join tags on tags.id_tag=t.id_tag 
                where tags.id_tag={$id} and p.is_published=1 order by p.id desc";
        $result = $this->db->query($sql);
		return ($result);
    }
	
	public function deleteTag($id){
        $id = (int)$id;
        $sql = "delete from tags where id_tag = {$id}";
        return $this->db->query($sql);
    }
	
	public function saveTag($data){
        if ( !isset($data['name'])){
            return false;
        }
        
        $name = $this->db->escape($data['name']);

        $sql = "insert into tags set tag_name = '{$name}' ";
        return $this->db->query($sql);
    }
	
	public function search($search){
        $sql = "SELECT * FROM tags WHERE tag_name LIKE '%{$search}%'";
        return $this->db->query($sql);
    }
}