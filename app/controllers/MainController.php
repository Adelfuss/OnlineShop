<?php


namespace app\controllers;


use ishop\App;
use ishop\base\Controller;

class MainController extends AppController
{

    public function indexAction()
    {
        $posts = \R::findAll('test');
        $post = \R::findOne('test','id = ?', [2]);
        $this->setMeta(App::$app->getProperty('shop_name'), 'Описание...', 'Ключевики...');
        $this->set(['name' => 'Bohdan', 'age' => 21, 'posts' => $posts]);
    }

}