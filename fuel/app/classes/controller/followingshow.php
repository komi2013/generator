<?php
class Controller_Followingshow extends Controller
{
	public function action_index()
	{
    $res[0] = 2;
    if ($_GET['endNum'] > 0)
    {
      $follower = DB::select()->from('follow')
        ->where('sender','=',$_GET['sender'])
        ->and_where('id','<',$_GET['endNum'])
        ->order_by('id', 'desc')
        ->limit(100)
        ->execute()
        ->as_array();
    }
    else
    {
      $follower = DB::select()->from('follow')
        ->where('sender','=',$_GET['sender'])
        ->order_by('id', 'desc')
        ->limit(100)
        ->execute()
        ->as_array();
    }
    foreach ($follower as $k => $d)
    {
      $arr[] = $d['receiver'];
    }
    if(isset($arr))
    {
      $follower = Model_Usr::find('all', array(
        'where' => array(
          array('id', 'in',$arr),
        ),
      ));
      $i = 0;
      foreach ($follower as $k => $d)
      {
        $res[1][$i][0] = $d->id;
        $res[1][$i][1] = Security::htmlentities($d->name);
        $res[1][$i][2] = $d->img;
        $res[0] = 1;
        ++$i;
      }
    }
    
    die(json_encode($res));
    
// 		return Response::forge(View::forge('welcome/index'));
	}
}
