<?php
class Controller_Following extends Controller
{
	public function action_index()
	{
    if(!isset($_GET['u'])) die(View::forge('404'));
    if(!is_numeric($_GET['u'])) die(View::forge('404'));
    $usr = Model_Usr::find('first', array(
      'where' => array(
        array('id', '=',$_GET['u']),
      ),
    ));
    $view = View::forge('following');
    $view->usr_id = $_GET['u'];
    $view->usr_img = '/assets/img/icon/guest.png';
    if (isset($usr->id))
    {
      $view->usr_img = $usr->img;
    }

    die($view);
	}
}
