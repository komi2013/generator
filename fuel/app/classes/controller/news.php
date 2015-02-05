<?php
class Controller_News extends Controller
{
	public function action_index()
	{
    $view = View::forge('news');
    die($view);
	}
}
