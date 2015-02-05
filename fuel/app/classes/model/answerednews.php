<?php

class Model_Answerednews extends \Orm\Model
{
  protected static $_properties = array(
    'id',
    'usr_id',
    'summary',
    'update_at',
    'question_id',
    'q_txt',
    'q_img',
  );
  protected static $_table_name = 'answered_news';

}