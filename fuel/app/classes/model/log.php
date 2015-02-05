<?php
class Model_Log extends \Model
{
  public static function warn($warn) 
  {
    $warn = $_SERVER['REQUEST_URI'].' '.$warn;
//    $warn = $warn.' GET ';
//    foreach ($_GET as $d) {
//      $warn = $warn.' '.$d;
//    }
    $warn = $warn.' POST ';
    foreach ($_POST as $d) {
      $warn = $warn.' '.$d;
    }
    
    Log::warning($warn);
  }
}