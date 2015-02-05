<?php
class Controller_Uquestionshow extends Controller
{
  public function action_index()
  {
    $res[0] = 2;
    if (!isset($_GET['usr']) OR !is_numeric($_GET['usr'])) {
      Model_Log::warn('no usr');
      die(json_encode($res));
    }

    $end_time = date('Y-m-d H:i:s',$_GET['endTime']);
    $query = DB::select()->from('question')
      ->where('usr_id','=',$_GET['usr'])
      ->and_where('open_time','<',$end_time)
      ->order_by('open_time','desc')
      ->limit(100)
      ->execute();
    
    $i = 0;
    foreach ($query as $k => $d)
    {
      $res[1][$i][0] = $d['id'];
      $txt = Security::htmlentities($d['txt']);
      $res[1][$i][1] = Str::truncate(Security::htmlentities($d['txt']), 30);
      $res[1][$i][2] = $img = Security::htmlentities($d['img']);
      $json_arr_q_data = json_encode(array($d['id'],$txt,$img,$d['usr_id']));
      $q_data = Crypt::encode($json_arr_q_data,Config::get('crypt_key.q_data'));
      $res[1][$i][3] = $q_data;
      $open_time = new DateTime($d['open_time']);
      $res[1][$i][4] = $open_time->getTimestamp();
      $res[0] = 1;
      ++$i;
    }
    die(json_encode($res));    
  }
}
