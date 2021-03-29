<?php


namespace ishop\base;


use ishop\Db;

abstract class Model
{
    public $attributes = [];
    public $errors = [];
    public $routes = [];

    public function __construct()
    {
        Db::instance();
    }
}