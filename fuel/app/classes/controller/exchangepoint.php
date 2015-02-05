<?php
class Controller_ExchangePoint extends Controller
{
  public function action_index()
  {
    Model_Csrf::setcsrf();
    $view = View::forge('exchange_point');
    die($view);
  }
}
