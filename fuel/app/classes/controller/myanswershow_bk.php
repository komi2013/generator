<?php
class Controller_Myanswershow extends Controller
{
  public function action_index()
  {
    $res[0] = 2;

    if (!isset($_GET['past']))
    {
      die(json_encode($res));
    }

    if ($_GET['endNum'] > 0)
    {
      $query = DB::select()->from('question')
        ->where('id','in',$_GET['past'])
        ->and_where('id','<',$_GET['endNum'])
        ->order_by('id','desc')
        ->limit(100)
        ->execute();
    }
    else
    {
      $query = DB::select()->from('question')
        ->where('id','in',$_GET['past'])
        ->order_by('id','desc')
        ->limit(100)
        ->execute();
    } 
    $i = 0;
    foreach ($query as $k => $d)
    {
      $res[1][$i][0] = $d['id'];
      $res[1][$i][1] = Str::truncate(Security::htmlentities($d['txt']), 30);
      $res[1][$i][2] = $d['img'];
      $res[0] = 1;
      ++$i;
    }
    die(json_encode($res));    
  }
}
