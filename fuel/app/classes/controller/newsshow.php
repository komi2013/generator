<?php
class Controller_Newsshow extends Controller
{
  public function action_index()
  {
    $res[0] = 2;
    $usr_id = Model_Cookie::get_usr();
    if (!$usr_id) {
      Model_Log::warn('no usr');
      die(json_encode($res));
    }    
    
    $query = DB::query("select * from answered_news where usr_id = ".$usr_id)
      ->execute()->as_array();
    DB::query("delete from answered_news where usr_id = ".$usr_id)->execute();  
    $arr_res = array();  
    foreach ($query as $d) {
      $q_img = preg_replace('/http/', 'url', $d['q_img']);
      $q_img = $q_img ?: '/assets/img/icon/quiz_generator.png';
      $arr_res[] = $d['summary'].'&nbsp;'.
        '<img src="/assets/img/icon/people.png" class="icon">&nbsp;'.
        '<img src="/assets/img/icon/answer.png" class="icon">&nbsp;'.
        '<a href="/quiz/?q='.$d['question_id'].'">'.
        '<img src="'.$q_img.'" class="icon" style="border:solid 1px rgba(0,0,255,0.2);"></a>';
      $res[0] = 1;
    }  
    $res[1] = $arr_res;
    
    $query = DB::query("select * from followed_news where receiver = ".$usr_id)
      ->execute()->as_array();
    DB::query("delete from followed_news where receiver = ".$usr_id)->execute();  
    $arr_res = array();  
    foreach ($query as $d)
    {
      $sender_img = $d['sender_img'] ?: '/assets/img/icon/guest.png';
      $arr_res[] = '<a href="/profile/?u='.$d['sender'].'">'.
        '<img src="'.$sender_img.'" class="icon" style="border:solid 1px rgba(0,0,255,0.2);"></a>&nbsp;'.
        '<img src="/assets/img/icon/star_1.png" class="icon" style="border:solid 1px rgba(0,0,255,0.2);">';
      $res[0] = 1;
    }
    $res[1] = array_merge($res[1], $arr_res);

    $query = DB::query("select * from private_news where usr_id = ".$usr_id)
      ->execute()->as_array();
    DB::query("delete from private_news where usr_id = ".$usr_id)->execute();  
    $arr_res = array();  
    foreach ($query as $d)
    {
      $arr_res[] = $d['txt'];
      $res[0] = 1;
    }
    $res[1] = array_merge($res[1], $arr_res);  
    $query = DB::query("select * from pay_answered_news where usr_id = ".$usr_id)
      ->execute()->as_array();
    DB::query("delete from pay_answered_news where usr_id = ".$usr_id)->execute();  
    $arr_res = array();  
    foreach ($query as $d)
    {
      $q_img = preg_replace('/http/', 'url', $d['q_img']);
      $q_img = $q_img ?: '/assets/img/icon/quiz_generator.png';
      $arr_res[] = $d['summary'].'&nbsp;'.
        '<img src="/assets/img/icon/people.png" class="icon">&nbsp;'.
        '<img src="/assets/img/icon/answer.png" class="icon">&nbsp;'.
        '<a href="/quiz/?q='.$d['question_id'].'">'.
        '<img src="'.$q_img.'" class="icon" style="border:solid 1px rgba(0,0,255,0.2);"></a>';
      $res[0] = 1;
    }
    $res[1] = array_merge($res[1], $arr_res);
    
    die(json_encode($res));
  }
}
