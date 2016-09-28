<?php

// Подключение к БД
function connectDB($host, $dbname, $user, $pass)
{
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass, [PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION]);

    } catch (PDOException $e) {
        die('База данных недоступна');
    }
    return $pdo;
}
// Функция для получения дерева категорий из БД

function getTree($pdo) {

    try {
        $qres = $pdo -> query('SELECT * FROM Categories ORDER BY level, parentId, position;'); // Запрос категорий
    }
    catch(PDOException $e) {
        die('База данных недоступна');
    }

    $qres -> setFetchMode(PDO::FETCH_ASSOC); // выбор формата получения результата

    $res = $qres -> fetch();
    $tree = array('name' => $res['name'],'id' => $res['id']);  // Создание массива для хранения дерева категорий


    while ($res = $qres -> fetch()) {
        if ( !catTree($tree,$res) ) die('Получены некорректные данные из базы');
    }

    return $tree;
}

// Функция для получения товаров в категории из БД

function getGoods($pdo, $id, $root) {

    try {
        if ($id==$root) {  // если мы находимся в корневой категории - запрашиваем товары, отображаемые на главной странице
       //     $qres = $pdo -> query("SELECT id, name, price, number, image FROM Goods
       //                    WHERE show_main = 1 ORDER BY name;");
            $qres = $pdo -> query("SELECT id, name, price, number, image FROM Goods  
                                   INNER JOIN Main_goods ON id = Goods_id
                                   ORDER BY name;");
        }
        else {  // в противном случае делаем запрос к БД на товары в текущей категории
            $qres = $pdo -> query("SELECT id, name, price, number, image FROM Goods  
                           WHERE Categories_id = $id ORDER BY name;");
        }
    }
    catch(PDOException $e) {
        die('База данных недоступна');
    }

    $qres -> setFetchMode(PDO::FETCH_ASSOC); // выбор формата получения результата

    $goods = []; // массив товаров в текущей категории

    while ($res = $qres -> fetch()) {
        $goods[] = $res;               // запись товаров из выборки в массив
    }

    return $goods;
}


// Функция для получения подробных характеристик товара из БД

function getGoodFull($pdo, $goodId) {

    try {
        $qres = $pdo -> query("SELECT * FROM Goods WHERE id = $goodId;"); // выбираем нужный товар из БД
    }
    catch(PDOException $e) {
        die('База данных недоступна');
    }

    $qres -> setFetchMode(PDO::FETCH_ASSOC); // выбор формата получения результата

    $goodFull = $qres -> fetch(); // goodFull - ассоциативный массив с характеристиками товара

    // далее запрашиваем массив с более подробными характеристиками

    try {
        $qres = $pdo -> query(" SELECT name, value, priority
                                FROM `eshop`.`Cats_has_Chars` AS A
                                INNER JOIN `eshop`.`Characteristics` AS B ON A.Char_id = B.id 
                                LEFT JOIN 
                                   (SELECT Char_id, value 
                                    FROM `eshop`.`Goods_has_Chars` 
                                    WHERE Good_id = $goodId) 
                                AS C ON B.id = C.Char_id
                                WHERE A.Cat_id = {$goodFull['Categories_id']}
                                ORDER BY priority DESC; "); // запрашиваем массив с характеристиками из БД
    }
    catch(PDOException $e) {
        die('База данных недоступна');
    }

    $qres -> setFetchMode(PDO::FETCH_ASSOC); // выбор формата получения результата

    $chars=[]; // массив с характеристиками

    while ($res = $qres -> fetch()) {
        $chars[] = $res;               // запись характеристик из выборки в массив
    }

    $goodFull['chars'] = $chars; // добавление массива с дополнительными характеристиками в массив с основными

    return $goodFull;
}

// Функция для получение пути к категории (товару) и подкатегорий

function getPathSubcats (array &$tree, $id, &$good = NULL) {
    $path=[]; // путь к текущей категории
    $subcats=[];  // дочерние категории для текущей

    if (isset($good)) {                // если находимся на странице с товаром
        $id = $good['Categories_id'];  // ищем путь к категории товара
    }

    findPath($tree,$id,$path,$subcats); // поиск пути к текущей категории и ее дочерних категорий

    if (isset($good)) {                // если находимся на странице с товаром
        $path[] = array('name' => $good['name']);  // добавляем имя товара в путь
    }

    return array('path' => $path, 'subcats' => $subcats);

}


// Рекурсивная функция поиска пути к заданной категории и ee дочерних категорий

function findPath(array &$tree, $id, array &$path, array &$subcats){
    if (in_array($id,$tree)) {                                          // элемент найден
        array_unshift($path,['name'=>$tree['name'],'id'=>$tree['id']]);   // запись в массив найденной категории
        for($i=0;$i<count($tree)-2;$i++) {
            $subcats[] = ['name'=>$tree[$i]['name'],'id'=>$tree[$i]['id']]; // запись в массив дочерних категорий для найденной
        }
        return true;
    }
    for($i=0;$i<count($tree)-2;$i++) {
        if (findPath($tree[$i],$id,$path,$subcats)) {                           // элемент найден в дочерних категориях
            array_unshift($path,['name'=>$tree['name'],'id'=>$tree['id']]); // запись в массив родительских категорий
            return true;
        }
    }
    return false;
}

// Рекурсивная функция для создания дерева категорий из выборки

function catTree (array &$tree, array &$res) {
    if ($res['parentId'] == $tree['id']) {                      // место для записи элемента найдено
        $tree[] = ['name' => $res['name'], 'id' => $res['id']]; // добавляем новый массив в первый свободный индекс текущего
        return true;
    }
    for($i=0;$i<count($tree)-2;$i++) {                // если текущий массив не подходит для записи - ищем в дочерних
        if ( catTree($tree[$i], $res) ) return true;  // рекурсивный вызов
    }
    return false;
}
