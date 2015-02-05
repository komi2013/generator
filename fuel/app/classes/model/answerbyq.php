<?php

class Model_AnswerByQ extends \Orm\Model
{
	protected static $_properties = array(
    'question_id',
    'correct' => array(
      'data_type' => 'int',
      'default' => 0,
    ),
    'amount' => array(
      'data_type' => 'int',
      'default' => 0,
    ),
    'update_at' => array(
      'data_type' => 'varchar',
    ),
	);
	protected static $_table_name = 'answer_by_q';
  protected static $_primary_key = array('question_id');

}