<?php
class Model_Util extends \Model
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
  public static function is_mobile() 
  {
    $useragents = array(
      'iPhone',          // iPhone
      'iPod',            // iPod touch
      'Android.*Mobile', // 1.5+ Android Only mobile
      'Windows.*Phone',  // Windows Phone
      'webOS',           // Palm Pre Experimental
      'mobile',       // Other iPhone browser
    );
    $pattern = '/'.implode('|', $useragents).'/i';
    return preg_match($pattern, $_SERVER['HTTP_USER_AGENT']);
  }
}