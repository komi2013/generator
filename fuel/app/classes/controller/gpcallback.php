<?php
class Controller_GpCallback extends Controller
{
  public function action_index()
  {
    function write_callback($curl, $output)
    {
      $output = json_decode($output);
      $contents = file_get_contents('https://www.googleapis.com/oauth2/v1/tokeninfo?access_token='.$output->access_token);
      $contents = json_decode($contents);
      $id = $contents->user_id;
      $u_id_cookie = Model_Cookie::get_usr();
      $u_id_cookie_param = $u_id_cookie ?: 0;
      $sql = "
        SELECT * FROM usr WHERE id = ".$u_id_cookie_param
        ." OR (pv_u_id = '".$id."' AND provider = 3)
        ORDER BY provider ASC 
      ";
      $arr_check_usr = DB::query($sql)->execute()->as_array();
      $auth_usr_i = 0; $myname = ''; $myphoto = ''; $introduce = ''; $dupli_auth = 0; $del_img = '';
      foreach ($arr_check_usr as $k => $d) {
        $usr_id = $d['id'];
        $myname = $myname ?: $d['name'];
        $myphoto = $myphoto ?: $d['img'];
        $introduce = $introduce ?: $d['introduce'];
        $point = $d['point'];
        if ($d['pv_u_id'] AND $d['provider']) {
          if ($id != $d['pv_u_id'] AND 3 != $d['provider']) {
            ++$dupli_auth;
          }
          ++$auth_usr_i;
        }
        if ($k == 1) {
          $del_img = $d['img'];
        }
      }
      if ($dupli_auth == 1) { //case of duplicate auth

        Response::redirect('/myprofile/?warn=logout');
      }
      if ($auth_usr_i < 1) {
        $usr = new Model_Usr();
        $usr_id = $usr->get_new_id();
        $usr->id = $usr_id;
        $usr->pv_u_id = $id;
        $usr->provider = 3;
        $usr->name = $myname = '';
        $usr->img = $myphoto = '';
        $usr->update_at = date("Y-m-d H:i:s");
        $usr->save();
        $point = 0;
        $introduce = '';
      }
      $mydata_before = Model_Mydata::find('first', array(
        'where' => array(
          array('usr_id', $usr_id),
        ),
      ));
      if (isset($mydata_before->answer)) {
        $arr_mydata_before[0] = $mydata_before->answer_by_u;
        $arr_mydata_before[1] = $mydata_before->answer;
      } else {
        $arr_mydata_before[0] = '';
        $arr_mydata_before[1] = '';
      }
      if ($u_id_cookie)
      {
        $mydata = Model_Mydata::find('first', array(
          'where' => array(
            array('usr_id', $u_id_cookie),
          ),
        ));
        if (isset($mydata->answer_by_u)) {
          $arr_mydata[0] = $mydata->answer_by_u;
          $arr_mydata[1] = $mydata->answer;
        } else {
          $arr_mydata[0] = '';
          $arr_mydata[1] = '';
        }
      }
      else
      {
        $arr_mydata[0] = '';
        $arr_mydata[1] = '';
      }

      $arr_answer_by_u_now = json_decode($arr_mydata[0]) ?: array(0,0);
      $arr_answer_by_u_before = json_decode($arr_mydata_before[0]) ?: array(0,0);
      $arr_answer_now = json_decode($arr_mydata[1]) ?: array();
      $arr_answer_before = json_decode($arr_mydata_before[1]) ?: array();

      if ($arr_answer_by_u_now[1] > $arr_answer_by_u_before[1]) {
        $arr_answer_by_u = $arr_answer_by_u_now; 
      } else {
        $arr_answer_by_u = $arr_answer_by_u_before;
      }

      // answer_by_u = [2,4], answer = [["682","gじyっd",txt,img],["680","potato",1],["680","potato",1]]
      $arr_answer = $arr_answer_now + $arr_answer_before;
      rsort($arr_answer);
      $arr_answer_new = array();
      $pre = 0;
      foreach ($arr_answer as $d)
      {
        if (isset($d[0]))
        {
          if ($pre == $d[0])
          {
            continue;
          }
          $arr_answer_new[] = $d;
          $pre = $d[0];
        }
      }
      DB::query("delete from mydata where usr_id = ".$usr_id." OR usr_id = ".$u_id_cookie_param)->execute();
      $json_answer_by_u = json_encode($arr_answer_by_u);
      $json_answer_new = json_encode($arr_answer_new);
      $mydata = new Model_Mydata();
      $mydata->usr_id = $usr_id;
      $mydata->answer_by_u = $json_answer_by_u;
      $mydata->answer = $json_answer_new;
      $mydata->update_at = date("Y-m-d H:i:s");
      $mydata->save();
      // when change mobile phone, merge data from previous
      if ($u_id_cookie and $u_id_cookie != $usr_id)
      {
        //merge usr id, first oauthed usr_id is high priority
        DB::update('answered_news')->value("usr_id",$usr_id)->where('usr_id', '=', $u_id_cookie)->execute();
        DB::update('correct')->value("usr_id",$usr_id)->where('usr_id', '=', $u_id_cookie)->execute();
        DB::update('incorrect')->value("usr_id",$usr_id)->where('usr_id', '=', $u_id_cookie)->execute();
        DB::update('followed_news')->value("receiver",$usr_id)->where('receiver', '=', $u_id_cookie)->execute();
        DB::update('followed_news')->value("sender",$usr_id)->where('sender', '=', $u_id_cookie)->execute();
        DB::update('question')->value("usr_id",$usr_id)->where('usr_id', '=', $u_id_cookie)->execute();
        $sql = '
          SELECT receiver FROM follow WHERE sender = '.$u_id_cookie.'
          EXCEPT
          SELECT receiver FROM follow WHERE sender = '.$usr_id.'
        ';
        $arr_receiver = DB::query($sql)->execute()->as_array();

        foreach ($arr_receiver as $k => $d) {
          if ($k == 0) {
            $sql = "INSERT INTO follow (sender,receiver,create_at) VALUES (".$usr_id.",".$d['receiver'].",'".date("Y-m-d H:i:s")."')";          
          } else {
            $sql = $sql.",(".$usr_id.",".$d['receiver'].",'".date("Y-m-d H:i:s")."')";
          }
        }
        if (isset($arr_receiver[0]['receiver'])) {
          DB::query($sql)->execute();
        }
        $sql = '
          SELECT sender FROM follow WHERE receiver = '.$u_id_cookie.'
          EXCEPT
          SELECT sender FROM follow WHERE receiver = '.$usr_id.'
        ';
        $arr_sender = DB::query($sql)->execute()->as_array();
        foreach ($arr_sender as $k => $d) {
          if ($k == 0) {
            $sql = "INSERT INTO follow (sender,receiver,create_at) VALUES (".$d['sender'].",".$usr_id.",'".date("Y-m-d H:i:s")."')";          
          } else {
            $sql = $sql.",(".$d['sender'].",".$usr_id.",'".date("Y-m-d H:i:s")."')";
          }
        }
        if (isset($arr_receiver[0]['sender'])) {
          DB::query($sql)->execute();
        }
        DB::query("update usr set name = '".$myname
                ."', img = '".$myphoto
                ."', point = point + '".$point
                ."', update_at = '".date("Y-m-d H:i:s")
                ."', introduce = '".$introduce
                ."' where id = ".$usr_id)->execute();
        DB::query("delete from usr where id = ".$u_id_cookie_param)->execute();
        @unlink(substr(DOCROOT, 0, -1).$del_img);
      }
      $res = DB::query("select receiver from follow where sender = ".$usr_id)->execute()->as_array();
      $arr = array();
      foreach ($res as $d)
      {
        $arr[] = $d['receiver'];
      }
      Cookie::set('follow', json_encode($arr));
      Cookie::set('myname', Security::htmlentities($myname));
      Cookie::set('myphoto', Security::htmlentities($myphoto));
      Cookie::set('point', $point);
      Cookie::set('ua_u_id', $usr_id);
      Cookie::set('answer', $json_answer_new);
      Cookie::set('answer_by_u', $json_answer_by_u);
      Model_Cookie::set_usr($usr_id);
      Response::redirect('/myprofile/');
    }  

    $post_data = array(
      'code' => $_GET['code'],
      'client_id' => Config::get('my.gp_id'),
      'client_secret' => Config::get('my.gp_secret'),
      'redirect_uri' => Config::get('my.gp_callback'),
      'grant_type' => 'authorization_code',
    );

    $curl = curl_init("https://accounts.google.com/o/oauth2/token");
    curl_setopt($curl,CURLOPT_POST, TRUE);
    // ↓はmultipartリクエストを許可していないサーバの場合はダメっぽいです
    curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post_data));
    curl_setopt($curl,CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl,CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($curl, CURLOPT_WRITEFUNCTION, 'write_callback') ;
    curl_exec($curl);
    curl_close($curl);

  }
}
