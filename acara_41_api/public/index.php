<?php

header('Content-Type: application/json');

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

require_once __DIR__ . '/../config/Database.php';
require_once __DIR__ . '/../models/Mahasiswa.php';
require_once __DIR__ . '/../controllers/MahasiswaController.php';
require_once __DIR__ . '/../routes/api.php';

$database = new Database();
$conn = $database->connect();

$model = new Mahasiswa($conn);
$controller = new MahasiswaController($model);

$method = $_SERVER['REQUEST_METHOD'];

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

$apiPosition = strpos($uri, '/api/');

if ($apiPosition !== false) {
    $path = substr($uri, $apiPosition + 1);
} else {
    $path = '';
}

$path = trim($path, '/');

handleApi(
    $method,
    $path,
    $controller
);