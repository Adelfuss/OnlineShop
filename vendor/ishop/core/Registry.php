<?php


namespace ishop;


class Registry
{
    use TSingeltone;

    protected static $properies = [];

    public static function setProperty($name,$value)
    {
        self::$properies[$name] = $value;
    }

    public function getProperty($name)
    {
        if (isset(self::$properies[$name])) {
            return self::$properies[$name];
        }
        return null;
    }

    public function getProperies()
    {
        return self::$properies;
    }
}