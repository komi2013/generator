<?php
class Controller_Mypaid extends Controller
{
	public function action_index()
	{
    $view = View::forge('mypaid');
    die($view);
	}
}
