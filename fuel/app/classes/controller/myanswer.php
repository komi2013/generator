<?php
class Controller_Myanswer extends Controller
{
	public function action_index()
	{
    $view = View::forge('myanswer');
    die($view);
	}
}
