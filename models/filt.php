<?php

class Filt extends Model{
	
	public function getTags(){
		$data = array();
        $sql='SELECT * FROM tags';
        $data = $this->db->query($sql);
		return $data;
	}

    public function getCategories(){
		$data = array();
        $sql='SELECT * FROM categories';
        $data = $this->db->query($sql);
        return $data;
    }

    public function getNews($data){
	
		if (!$data['date_from']) {
            $sql = "select date(min(p.date)) as dat from pages p where p.is_published=1 limit 1";
            $date = $this->db->query($sql);
            $data['date_from'] = $date[0]['dat'];
        }
        if (!$data['date_to']) {
            $sql = "select date(max(p.date)) as dat from pages p where p.is_published=1 limit 1";
            $date = $this->db->query($sql);
            $data['date_to'] = $date[0]['dat'];
        }
        $sql = "select distinct  p.* from pages p
              left join tag_news t on t.id_news=p.id
              where p.is_published=1 and date(p.date)between '{$data['date_from']}' and '{$data['date_to']}'";
        if (isset($data['tags'])) {
            $tmp = null;
            foreach ($data['tags'] as $t) {
                $tmp .= $t.',';
            }
            $data['tags'] = substr($tmp, 0, -1);
            $sql .= " and t.id_tag in({$data['tags']})";
        }
        if (isset($data['categories'])) {
            $cat = null;
            foreach ($data['categories'] as $c) {
                $cat .= $c.',';
            }
            $data['categories'] = substr($cat, 0, -1);
            $sql .= " and p.categories_id in({$data['categories']})";
        }

        return $this->db->query($sql);
	}
}