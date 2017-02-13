<?php

class Comment extends Model
{

    public function getCommentById($id_comment){
        $sql = "SELECT u.login, c.* FROM comments c
        left join users u on u.id=c.id_user
        where id_comment='{$id_comment}'";
        return $this->db->query($sql);
    }

    public function get_comments($id_news){
        $sql = "SELECT u.login, c.* FROM comments c
        left join users u on u.id=c.id_user
        where id_pages='{$id_news}' and c.is_active=1 order by cnt_like desc";
        $result = $this->db->query($sql);
        foreach ($result as $key => $value) {
            if ($value['id_parent'] == 0) {
                $results[$value['id_comment']] = $value;
            } else {
                $results[$value['id_parent']]['childs'][] = $value;
            }
        }
        $results['count'] = count($result);
        return $results;
    }
	
// admin 
    public function getComments(){
        $sql="select c.id_comment,c.id_parent,u.login,p.title,cat.name, c.`comment`,c.cnt_like,c.cnt_dislike,c.is_active from comments c
            left join users u on u.id=c.id_user
            left join pages p on p.id=c.id_pages
            left join categories cat on cat.id=p.categories_id";
        $result = $this->db->query($sql);
        return $result;
    }
	
    public function getCommentsCheck(){
        $sql="select c.id_comment,c.id_parent,u.login,p.title,cat.name, c.`comment`,c.cnt_like,c.cnt_dislike,c.is_active from comments c
            left join users u on u.id=c.id_user
            left join pages p on p.id=c.id_pages
            left join categories cat on cat.id=p.categories_id 
			where c.is_active=0";
        $result = $this->db->query($sql);
        return $result;
    }
	
    public function deleteComment($id){
        $sql="delete from comments where id_comment={$id}";
        $this->db->query($sql);
    }

    public function editComment($id){
        $sql="select * from comments where id_comment={$id}";
        return $this->db->query($sql);
    }

    public function changeComment($id_comment, $comment, $is_active){
        $is_active = $is_active ? 1 : 0;
        $sql = "update comments set `comment`='{$comment}',
					is_active='{$is_active}'
					where id_comment ={$id_comment}";
        $this->db->query($sql);
    }
// admin 

    public function topUsers(){
        $sql = "select c.*,count(*) as cnt,u.login from comments c
              left join users u on u.id=c.id_user
              group by c.id_user order by cnt desc
              limit 5";
        return $this->db->query($sql);
    }

    public function topNews(){
        $sql = "select c.*,count(*) as cnt,p.title from comments c
			left join pages p on p.id=c.id_pages
			group by c.id_pages order by cnt desc
            limit 3";
        return $this->db->query($sql);
    }

    public function getCommentsByUser($id_user){
        $sql = "select c.*,p.title,u.login from comments c
              left join users u on u.id=c.id_user
              left join pages p on p.id=c.id_pages
              where c.id_user ={$id_user}";
        $result['comments'] = $this->db->query($sql);
        return $result;
    }

    public function like($id_comment, $type){
        $type = 'cnt_' . $type;
        $sql = ("UPDATE comments SET {$type}=({$type}+1) WHERE id_comment='{$id_comment}'");
        $result = $this->db->query($sql);
    }

    public function add_comment($user, $id_news, $comment, $id_parent = 0){
        $is_active = $this->check_comment($id_news);
        $user = "select id,login from users where login like '%{$user}%'";
        $comment = htmlspecialchars($this->db->escape($comment));
        if ($result = $this->db->query($user)) {
            $id_user = $result[0]['id'];
        }
        $sql = "
            insert into comments
            set id_user='{$id_user}',
                id_pages='{$id_news}',
                `comment`='{$comment}',
                id_parent='{$id_parent}',
                is_active='{$is_active}'
            ";
        $this->db->query($sql);

        $result = $this->get_comments($id_news);
        return $result;
    }

    public function check_comment($id_news){
        $sql = "select p.id from pages p
        where p.id={$id_news} and p.categories_id=3 limit 1";
        $result = $this->db->query($sql);
        if (empty($result)) {
            return 1;
        } else {
            return 0;
        }
    }
}