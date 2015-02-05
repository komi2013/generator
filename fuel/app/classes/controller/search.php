<?php
class Controller_Search extends Controller
{
  public function action_index()
  {
    die(View::forge('search'));
  }
}
