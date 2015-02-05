<?php
class Controller_Admin extends Controller
{
  public function action_index()
  {
    $usr_id = Model_Cookie::get_usr();
    $auth = false;
    foreach (Config::get('my.adm') as $d)
    {
      if ($d == $usr_id)
      {
        $auth = true;
      }
    }
    if (!$auth)
    {
      die(View::forge('404'));
    }
    
    Model_Csrf::setcsrf();
    $view = View::forge('admin');
    $res = DB::query("select count(*) from question")->execute()->as_array();
    $cnt = ceil(($res[0]['count'])/100);
    if (isset($_GET['page']))
    {
      $page = $_GET['page'];
    }
    else
    {
      $page = $cnt;
    }
    $view->page = $page;
//     $view->question = array();
    $offset = ($cnt - $page)*100;
    $q_check = false; 
    if ($page > 0 && $offset > -1)
    {
      $view->question = DB::select()->from('question')
        ->order_by('id', 'desc')->limit(100)->offset($offset)
        ->execute()->as_array();
      $q_check = true; 
    }
    
    $res = DB::query("select count(*) from usr")->execute()->as_array();
    $cnt = ceil(($res[0]['count'])/100);
    if (isset($_GET['page']))
    {
      $page = $_GET['page'];
    }
    else
    {
      $page = $cnt;
    }
    $view->page = $page;
//     $view->question = array();
    $u_check = false;
    if ($page > 0 && $offset > -1)
    {
      $view->usr = DB::select()->from('usr')
        ->order_by('id', 'desc')->limit(100)->offset($offset)
        ->execute()->as_array();
      $u_check = true;
    }
    $view->contact = DB::query("select * from contact")->execute()->as_array();
    
    if (!$q_check && !$u_check)
    {
      $view = View::forge('404');
    }
    die($view);
  }
}
