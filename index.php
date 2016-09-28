<?php

require 'vendor/autoload.php';
require 'php/model.php';

// Константы для подключения к БД
define ('HOST', 'localhost');
define ('DBNAME', 'eshop');
define ('USER', 'php');
define ('PASS', 'pa$$w0rd');

// Подключение Twig

$loader = new Twig_Loader_Filesystem('templates');
$twig = new Twig_Environment($loader);

/////////////////////////////////////////

$pdo = connectDB(HOST, DBNAME, USER, PASS); // Подключение к БД

$tree = getTree($pdo); // получение дерева категорий из БД

if (isset($_GET['id'])) {
	$id = $_GET['id'];     // установка id текущей категории
}
else {
	$id=$tree['id']; // если id в запросе отсутствует - устанавливается корневой id
}

$renderAr = [ 'url' => $_SERVER['REQUEST_URI'],  // массив данных для отправки шаблонизатору
              'currentId' => $id,
              'tree' => $tree
            ];

// Если находимся на странице с товаром
if ( isset($_GET['good']) ) {
    $renderAr['goodFull'] = getGoodFull($pdo,$_GET['good']);    // добавляем массив с описанием товара

    $pathAndSubcats = getPathSubcats($tree, $id, $renderAr['goodFull']); // добавляем путь к товару
    $renderAr['path'] = $pathAndSubcats['path'];                         // для меню на странице
}
// В противном случае
else {
    $renderAr['goods'] = getGoods($pdo, $id, $tree['id']); // добавляем массив товаров из текущей категории

    $pathAndSubcats = getPathSubcats($tree, $id);          // добавляем путь к категории и подкатегории
    $renderAr['path'] = $pathAndSubcats['path'];           // для меню на странице
    $renderAr['subcats'] = $pathAndSubcats['subcats'];
}

echo $twig->render('main.html', $renderAr);
