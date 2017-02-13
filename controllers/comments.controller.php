<?php

class CommentsController extends Controller
{
    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model = new Comment();
    }

    public function user(){
        $params = App::getRouter()->getParams();
		$id = $params[0];
        $this->data = $this->model->getCommentsByUser($id);
    }

	public function page(){
        if (isset($_POST['id_comment']) && isset($_POST['type'])) {
            $id_comment = $_POST['id_comment'];
            $type = $_POST['type'];
            return $this->model->like($id_comment, $type);
        }
        if( isset($_POST['comment']) && !empty($_POST['comment'])){
            $id_news=$_POST['id_news'];
            $id_parent=isset($_POST['id_parent']) ? $_POST['id_parent'] : 0;
            $this->data['comments']=$this->model->add_comment(Session::get('login'),$id_news,$_POST['comment'],$id_parent);
 			Router::redirect("/pages/view/{$id_news}");
		}
    }
	
    public function admin_delete(){
        $id = $this->params[0];
        $this->model->deleteComment($id);
        Router::redirect('/admin/comments');
    }

    public function admin_edit(){
        if (isset($_POST['id_comment'])&& !empty($_POST['id_comment'])) {
            $this->model->changeComment($_POST['id_comment'],$_POST['comment'],$_POST['is_active']);
            Router::redirect('/admin/comments');
        } else {
            $id = $this->params[0];
            $this->data = $this->model->editComment($id);
        }

    }

    public function admin_index(){
        $this->data['comments'] = $this->model->getComments();
    }

    public function admin_check(){
        $this->data['comments'] = $this->model->getCommentsCheck();
    }
	
}