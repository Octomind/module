<?php

class Page extends Model{

    public function getList($only_published = false){
        $sql = "select * from pages where 1";
        if ( $only_published ){
            $sql .= " and is_published = 1";
        }
        return $this->db->query($sql);
    }

/*     public function getByAlias($alias){
        $alias = $this->db->escape($alias);
        $sql = "select * from pages where alias = '{$alias}' limit 1";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result[0] : null;
    } */

    public function getById($id){
        $id = (int)$id;
        $sql = "select p.*,tags.id_tag,tags.tag_name from pages p
				left join tag_news t on t.id_news=p.id
                left join tags on tags.id_tag=t.id_tag 
				where p.id = '{$id}' limit 1";
        $result = $this->db->query($sql);
		if (!Session::get('login') && $result['is_analitic'] == 1) {
            $result['content'] = $this->is_analitic($result['content'], 5);
        }
        if ($tags = $this->get_tags($id)){
            $result['tags'] = $tags;
        }
		// return isset($result[0]) ? $result[0] : null;
		return $result;
    }
	
	public function is_analitic($content, $row = 5)
    {
        $sentences = explode('.', $content);
        $content = '';
        for ($i = 0; $i < $row; $i++) {
            if (!isset($sentences[$i])) {
                return $content;
            }
            $content .= $sentences[$i] . '.';
        }
        return $content;
    }
	
	public function get_tags($id)
    {
        $id = (int)$id;
        $sql = "SELECT  t.id_tag,tags.tag_name from pages
                right join tag_news t on t.id_news=pages.id
                left join tags on tags.id_tag=t.id_tag
                where pages.id='{$id}' ";
        $result = $this->db->query($sql);
        if ($result) {
            for ($i = 0; $i < count($result); $i++) {
                $results[$result[$i]['id_tag']] = $result[$i]['tag_name'];
            }
            return $results;
        }
        return false;
    }

	public function getByCat($cat){
        $sql = "select * from pages where cat = '{$cat}'";
        return $this->db->query($sql);
    }
	
	
    public function save($data, $id = null){
        if (/*  !isset($data['image']) || */ !isset($data['title']) || !isset($data['content']) || !isset($data['categories']) ){
            return false;
        }

/*         $image = $this->db->escape($data['image']);
 */        $title = $this->db->escape($data['title']);
        $content = $this->db->escape($data['content']);
        $is_published = isset($data['is_published']) ? 1 : 0;
		$is_analitic = isset($data['is_analitic']) ? 1 : 0;
		$categories = $this->db->escape($data['categories']);
		if($_FILES['image']['name']!==null){
			$image = $_FILES['image']['name'];
			move_uploaded_file($_FILES['image']['tmp_name'], ROOT.DS.'webroot'.DS.'img'.DS.$image);
		}

        if ( is_null($id)){ // Add new record
            $sql = "
                insert into pages
                   set image = '{$image}',
                       title = '{$title}',
                       content = '{$content}',
                       is_published = '{$is_published}',
					   is_analitic='{$is_analitic}',
					   categories_id = '{$categories}'
            ";
        } else { // Update existing record
            $sql = "
                update pages
                   set image = '{$image}',
                       title = '{$title}',
                       content = '{$content}',
                       is_published = '{$is_published}',
					   is_analitic='{$is_analitic}',
					   categories_id = '{$categories}'
                   where id = {$id}
            ";
        }
        if (isset($data['tags'])) {
            $this->saveTag($data['tags'], $id);
        }
        return $this->db->query($sql);
    }
	
	public function saveTag($tags, $id_news = null) {
        $cnt_tags = count($tags);
        $sql = "delete * from tag_news where id_news='{$id_news}'";
        $this->db->query($sql);
        for ($i = 0; $i < $cnt_tags; $i++) {
            $sql = "insert into tag_news
                    set id_news='{$id_news}',
                    id_tag='{$tags[$i]}'";
            $this->db->query($sql);
        }
    }
	
	
	
	public function getCategory(){
        $sql = "SELECT * FROM categories";
        $result = $this->db->query($sql);
        return $result;
    }

	public function getTag(){
        $sql = "SELECT * FROM tags";
        $result = $this->db->query($sql);
        return $result;
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
	
    public function delete($id){
        $id = (int)$id;
        $sql = "delete from pages where id = {$id}";
        return $this->db->query($sql);
    }

}