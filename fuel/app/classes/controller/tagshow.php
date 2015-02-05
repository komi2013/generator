<?php
class Controller_Tagshow extends Controller
{
  public function action_index()
  {
    $res[0] = 2;
    if(!isset($_GET['q']) OR !is_numeric($_GET['q'])) {
      Model_Log::warn('no q');
      die(json_encode($res));  
    } 
    
    $query = DB::select()->from('tag')
      ->where('question_id','=',$_GET['q'])
      ->execute()->as_array();
    
    $arr_tag = array();
    foreach ($query as $d)
    {
      $arr_tag[] = $d['txt'];
    }
    
    $res[0] = 1;
    $res[1] = $arr_tag;
    die(json_encode($res));    
  }
}
