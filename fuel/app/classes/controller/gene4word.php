<?php
class Controller_Gene4word extends Controller
{
  public function action_index()
  {
    Model_Csrf::setcsrf();
    $usr_id = Model_Cookie::get_usr();
    $query = DB::select()->from('question')
      ->where('usr_id','=',$usr_id)
      ->order_by('open_time', 'desc')
      //->limit(20)
      ->execute()->as_array();
    $now = new DateTime("now");
    if (isset($query[0]['open_time'])) {
      $available = new DateTime($query[0]['open_time']);
      $now_6 = new DateTime("now");
      $now_6->add(new DateInterval('P6D'));
      if ($now_6 < $available) {
        $available->sub( new DateInterval('P6D') );
        $view = View::forge('generate_limited');
        $view->available = $available->format('Y-m-d H:i:s');
        die($view);
      }
      $last_open_time = new DateTime($query[0]['open_time']);
      $last_open_time->add( new DateInterval('PT3H'));

      if ($now < $last_open_time) {
        
        $open_time = $last_open_time->format('Y-m-d H:i:s');
      } else {
        $open_time = $now->format('Y-m-d H:i:s');
      }
    } else {
      $open_time = $now->format('Y-m-d H:i:s');
    }
    Model_Cookie::set('open_time', $open_time);
    die(View::forge('generate_4word'));
  }
}
