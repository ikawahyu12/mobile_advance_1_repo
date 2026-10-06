<?php

function handleApi(
    string $method,
    string $path,
    MahasiswaController $controller
): void {

    $path = trim($path, '/');

    // GET /api/mahasiswa
    if ($method === 'GET' && $path === 'api/mahasiswa') {
        $controller->index();
        return;
    }

    // POST /api/mahasiswa
    if ($method === 'POST' && $path === 'api/mahasiswa') {
        $controller->store();
        return;
    }

    // GET /api/mahasiswa/{id}
    if (
        $method === 'GET' &&
        preg_match('#^api/mahasiswa/(\d+)$#', $path, $matches)
    ) {
        $controller->show((int) $matches[1]);
        return;
    }

    // PUT /api/mahasiswa/{id}
    if (
        $method === 'PUT' &&
        preg_match('#^api/mahasiswa/(\d+)$#', $path, $matches)
    ) {
        $controller->update((int) $matches[1]);
        return;
    }

    // DELETE /api/mahasiswa/{id}
    if (
        $method === 'DELETE' &&
        preg_match('#^api/mahasiswa/(\d+)$#', $path, $matches)
    ) {
        $controller->destroy((int) $matches[1]);
        return;
    }

    http_response_code(404);

    echo json_encode([
        'success' => false,
        'message' => 'Endpoint tidak ditemukan'
    ]);
}