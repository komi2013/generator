<?php
class Controller_Rank extends Controller
{
  public function action_index()
  {
    if (isset($_GET['tag'])) {
      $tag = $_GET['tag'];
    }else{
      $tag = '中学歴史';
    }
    $view = View::forge('rank');
    $view->tag = $tag;
    $tag = preg_replace('/\W+/u', '', $tag);
    $tag_rank = DB::query(
      "SELECT usr_id, count(*) FROM tag_rank WHERE tag = "
      ." '".$tag."' "
      ." AND create_at > "
      ." '".date('Y-m-d H:i:s',strtotime('-1 month'))."' "
        ." GROUP BY usr_id "
      )->execute()->as_array();
    $asc_tag_rank = array();
    $priority = array();
    foreach ($tag_rank as $d) {
      $arr_usr_id[] = $d['usr_id'];
      $asc_tag_rank[$d['usr_id']]['usr_id'] = $d['usr_id'];
      $asc_tag_rank[$d['usr_id']]['count'] = $d['count'];
      $asc_tag_rank[$d['usr_id']]['name'] = 'ゲスト';
      $asc_tag_rank[$d['usr_id']]['img'] = '/assets/img/icon/guest.png';
      $priority[] = $d['count'];
    }
    if (isset($arr_usr_id[0])) {
      $arr_usr = DB::select()->from('usr')
        ->where('id','in',$arr_usr_id)
        ->execute()->as_array()
        ;
      foreach ($arr_usr as $d) {
        $asc_tag_rank[$d['id']]['name'] = $d['name'];
        $asc_tag_rank[$d['id']]['img'] = $d['img'];
      }
      array_multisort ($priority, SORT_DESC, $asc_tag_rank);
    }
    
    $view->asc_tag_rank = $asc_tag_rank; 
    die($view);
  }
}
