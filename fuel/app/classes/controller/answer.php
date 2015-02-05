<?php
class Controller_Answer extends Controller
{
  public function action_index()
  {
    $res[0] = 2;
    Model_Csrf::check();
    if (!isset($_POST['question']) OR !is_numeric($_POST['question']))
    {
      Model_Log::warn('no question');
      die(json_encode($res));
    }
    $question_id = $_POST['question'];
    if (Model_Cookie::get_usr('u_id'))
    {
      $usr_id = Model_Cookie::get_usr('u_id');
    }
    else
    {
      $usr = new Model_Usr();
      $usr_id = $usr->get_new_id();
      Model_Cookie::set_usr($usr_id);
      Cookie::set('ua_u_id',$usr_id);
    }
    try
    {
      $answer_by_q = Model_AnswerByQ::find('first', array(
        'where' => array(
          array('question_id', $question_id),
        ),
      ));
      if ($_POST['correct'] == 1)
      {
        $answer_by_q->correct++;
      }
      $answer_by_q->amount++;
      $answer_by_q->save();

      if ($_POST['correct'] == 1)
      {
        $correct = new Model_Correct();
        $correct->question_id = $question_id;
        $correct->usr_id = $usr_id;
        $correct->create_at = date("Y-m-d H:i:s");
        $correct->save();

        $res = DB::query("select id from correct where question_id = ".$question_id." order by id desc offset 16")
          ->execute()->as_array();
        if (isset($res[0]['id']))
        {
          DB::query("delete from correct where id < ".$res[0]['id'])
            ->execute();
        }

        if(isset($_POST['arr_tag'][0])){
          $sql_value = 'INSERT INTO tag_rank (usr_id,tag,create_at) VALUES ';
          if(isset($_POST['arr_tag'][0])){
            $without_hash = preg_replace('/#/u', '', $_POST['arr_tag'][0]);
            $sql_value = $sql_value."(".$usr_id.",'".preg_replace('/\W+/u', '_', $without_hash)."','".date('Y-m-d H:i:s')."')";
          }
          if(isset($_POST['arr_tag'][1])){
            $without_hash = preg_replace('/#/u', '', $_POST['arr_tag'][1]);
            $sql_value = $sql_value.",(".$usr_id.",'".preg_replace('/\W+/u', '_', $without_hash)."','".date('Y-m-d H:i:s')."')";
          }
          if(isset($_POST['arr_tag'][2])){
            $without_hash = preg_replace('/#/u', '', $_POST['arr_tag'][2]);
            $sql_value = $sql_value.",(".$usr_id.",'".preg_replace('/\W+/u', '_', $without_hash)."','".date('Y-m-d H:i:s')."')";
          }
          DB::query($sql_value)->execute();
        }
      }
      else
      {
        $incorrect = new Model_Incorrect();
        $incorrect->question_id = $question_id;
        $incorrect->usr_id = $usr_id;
        $incorrect->create_at = date("Y-m-d H:i:s");
      	$incorrect->save();

        $res = DB::query("select id from incorrect where question_id = ".$question_id." order by id desc offset 16")
         ->execute()->as_array();
        if (isset($res[0]['id']))
        {
         DB::query("delete from incorrect where id < ".$res[0]['id'])
           ->execute();
        }
      }
      $answered_news = Model_Answerednews::find('first', array(
        'where' => array(
          array('question_id', $question_id),
          array('usr_id', $_POST['usr']),
        ),
      ));

      if (isset($answered_news->id))
      {
        $answered_news->summary++;
      }
      else
      {
        $answered_news = new Model_Answerednews();
        $answered_news->summary = 1;
        $answered_news->question_id = $question_id;
        $answered_news->q_txt = $_POST['q_txt'];
        $answered_news->q_img = $_POST['q_img'];
        $answered_news->usr_id = $_POST['usr'];
      }
      $answered_news->update_at = date("Y-m-d H:i:s");
      $answered_news->save();
    }
    catch (Orm\ValidationFailed $e)
    {
      $res[1] = $e->getMessage();
      Model_Log::warn('orm err');
      die(json_encode($res));
    }
    Model_Csrf::setcsrf();
    $res[0] = 1;
//     $res[1] = $question_id;
//     $res[1] = $e->getMessage();
    die(json_encode($res));
  }
}
