<?php
class Controller_Quiz extends Controller
{
  public function action_index()
  {
    if (isset($_GET['crypt_q'])) {
      $json_arr_q_data = Crypt::decode($_GET['crypt_q'],Config::get('crypt_key.q_data'));
      $arr_q_data = json_decode($json_arr_q_data);
      if ($arr_q_data) {
        $question_id =  $arr_q_data[0];
        $q_txt = $arr_q_data[1];
        $q_img = $arr_q_data[2];
        $q_u_id = $arr_q_data[3];
      } else {
        die(View::forge('no_data'));
      }
    } else if ( isset($_GET['q']) AND is_numeric($_GET['q']) ) {
      $arr_question = DB::select()->from('question')->where('id','=',$_GET['q'])->execute()->as_array();
      if (isset($arr_question[0]['id'])) {
        $question_id =  $arr_question[0]['id'];
        $q_txt = $arr_question[0]['txt'];
        $q_img = $arr_question[0]['img'];
        $q_u_id = $arr_question[0]['usr_id'];
      } else {
        die(View::forge('no_data'));
      }
    } else {
      die(View::forge('no_data'));
    }
    $arr_choice_1 = DB::select()->from('choice')->where('question_id','=',$question_id)->execute()->as_array();
    if (!isset($arr_choice_1[0]['choice_0'])) die(View::forge('no_data'));

    $random_choice = array(
      Security::htmlentities($arr_choice_1[0]['choice_0']),
      Security::htmlentities($arr_choice_1[0]['choice_1']),
      Security::htmlentities($arr_choice_1[0]['choice_2']),
      Security::htmlentities($arr_choice_1[0]['choice_3'])
    );
    $view = View::forge('quiz');
    Model_Csrf::setcsrf();
    $description = 
      Str::truncate($random_choice[0], 20).', '.
      Str::truncate($random_choice[1], 20).', '.
      Str::truncate($random_choice[2], 20).', '.
      Str::truncate($random_choice[3], 20).', ';
    $q_txt = Security::htmlentities($q_txt);
    $view->img = $q_img;
    shuffle($random_choice);
    $view->arr_choice = $random_choice;
    $view->question = $question_id;
    $view->correct = $arr_choice_1[0]['choice_0'];
    $view->usr = $q_u_id;
    $view->fb_url = 'http://www.facebook.com/sharer.php?u=http://'.
        Config::get('my.domain').
        '/quiz/?q='.
        $question_id.'%26cpn=share_fb';
    $view->tw_url = 
        'https://twitter.com/intent/tweet?url=http://'.
        Config::get('my.domain').
        '/quiz/?q='.$question_id.'%26cpn=share_tw'.
        '&text='.
        $q_txt.',,'.$description;
    $view->ln_url = 'line://msg/text/?'.
        $q_txt.
        '%0D%0Ahttp://'.
        Config::get('my.domain').
        '/quiz/?q='.
        $question_id.'%26cpn=share_ln';
    $view->description = $description;
    $view->q_txt = $q_txt;
    $json_arr_q_data = json_encode(array($question_id,$q_txt,$q_img,$q_u_id));
    $q_data = Crypt::encode($json_arr_q_data,Config::get('crypt_key.q_data'));
    $view->q_data = $q_data;
    die($view);
  }
}
