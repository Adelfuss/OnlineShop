<?php


namespace app\controllers;


use ishop\App;
use ishop\base\Controller;
use ishop\Cache;

class MainController extends AppController
{

    public function indexAction()
    {
        $posts = \R::findAll('test');
        $post = \R::findOne('test','id = ?', [2]);
        $this->setMeta(App::$app->getProperty('shop_name'), 'Описание...', 'Ключевики...');
        $name = 'John';
        $age = 30;
        $names = ['Bohdan', 'Lyhoshapko','Mike'];
        $cache = Cache::instance();
        $data = $cache->get('test');
        if (!$data) {
            $cache->set('test',$names);
        }
        debug($data);
        $this->set(compact('name','age','names','posts'));
    }

}