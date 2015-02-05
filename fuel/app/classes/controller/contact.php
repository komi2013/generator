<?php
class Controller_Contact extends Controller
{
  public function action_index()
  {
    Model_Csrf::setcsrf();
    $view = View::forge('contact');
    die($view);
  }
}
