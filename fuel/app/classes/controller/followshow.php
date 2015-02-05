<?php
class Controller_Followshow extends Controller
{
  public function action_index()
  {
    if(!isset($_GET['follow'])) die(json_encode($res));
    $res[0] = 2;
    
    $end_time = date('Y-m-d H:i:s',$_GET['endTime']);
    
    $query = DB::select()->from('question')
      ->where('usr_id','in',$_GET['follow'])
      ->and_where('open_time','<',$end_time)
      ->order_by('open_time','desc')
      ->limit(100)
      ->execute();
    $i = 0;
    foreach ($query as $k => $d)
    {
      $res[1][$i][0] = $d['id'];
      $res[1][$i][1] = Str::truncate(Security::htmlentities($d['txt']), 12);
      $res[1][$i][2] = $d['img'];
      $json_arr_q_data = json_encode(array($d['id'],$d['txt'],$d['img'],$d['usr_id']));
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
