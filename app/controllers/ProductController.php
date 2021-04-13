<?php


namespace app\controllers;


class ProductController extends AppController
{
    public function viewAction()
    {
        $alias = $this->route['alias'];
        $product = \R::findOne('product', "alias = ? AND status ='1'", [$alias]);
        if (!$product) {
            throw new \Exception('Страница не найдена',404);
        }
        // хлебные крошки

        // связанные товары

        //записать в куки запрошенный товар

        // просмотренные товари

        // галерея

        // модификации

        $this->setMeta($product->title, $product->description,$product->keywords);
        $this->set(compact('product'));
    }
}