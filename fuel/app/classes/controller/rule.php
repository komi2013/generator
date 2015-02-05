<?php
class Controller_Rule extends Controller
{
	public function action_index()
	{
    $view = View::forge('rule');
    die($view);
	}
}
