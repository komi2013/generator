<?php
class Controller_Profile extends Controller
{
  public function action_index()
  {
    if (!isset($_GET['u']) OR !is_numeric($_GET['u']))
    {
      die(View::forge('no_data'));
    }
    Model_Csrf::setcsrf();
    $view = View::forge('profile');
    $usr = Model_Usr::find('first', array(
      'where' => array(
        array('id', '=',$_GET['u']),
      ),
    ));
    $view->usr_id = $_GET['u'];
    $view->usr_name = 'guest';
    $view->usr_img = '/assets/img/icon/guest.png';
    $view->introduce = '';
    
    if (isset($usr->id))
    {
      $view->usr_name = Security::htmlentities($usr->name);
      $view->usr_img = Security::htmlentities($usr->img);
      $view->introduce = Security::htmlentities($usr->introduce);
    }

    $res = DB::query("select count(*) from question where usr_id = ".$_GET['u'])->execute()->as_array();
    $view->num_quiz = $res[0]['count'];
    $res = DB::query("select count(*) from follow where receiver = ".$_GET['u'])->execute()->as_array();
    $view->follower = $res[0]['count'];
    $res = DB::query("select count(*) from follow where sender = ".$_GET['u'])->execute()->as_array();
    $view->following = $res[0]['count'];

    die($view);
  }
}
