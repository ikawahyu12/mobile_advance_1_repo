<?php

class MahasiswaController
{
    private Mahasiswa $model;

    public function __construct(Mahasiswa $model)
    {
        $this->model = $model;
    }

    // GET /api/mahasiswa
    public function index(): void
    {
        $data = $this->model->getAll();

        echo json_encode([
            'success' => true,
            'data' => $data
        ]);
    }

    // GET /api/mahasiswa/{id}
    public function show(int $id): void
    {
        $data = $this->model->getById($id);

        if (!$data) {
            http_response_code(404);

            echo json_encode([
                'success' => false,
                'message' => 'Data mahasiswa tidak ditemukan'
            ]);

            return;
        }

        echo json_encode([
            'success' => true,
            'data' => $data
        ]);
    }

    // POST /api/mahasiswa
    public function store(): void
    {
        $input = json_decode(
            file_get_contents('php://input'),
            true
        );

        if (
            empty($input['nim']) ||
            empty($input['nama']) ||
            empty($input['prodi'])
        ) {
            http_response_code(400);

            echo json_encode([
                'success' => false,
                'message' => 'nim, nama, dan prodi wajib diisi'
            ]);

            return;
        }

        $success = $this->model->create(
            $input['nim'],
            $input['nama'],
            $input['prodi']
        );

        if ($success) {
            http_response_code(201);

            echo json_encode([
                'success' => true,
                'message' => 'Mahasiswa berhasil ditambahkan'
            ]);
        }
    }

    // PUT /api/mahasiswa/{id}
    public function update(int $id): void
    {
        $existing = $this->model->getById($id);

        if (!$existing) {
            http_response_code(404);

            echo json_encode([
                'success' => false,
                'message' => 'Data mahasiswa tidak ditemukan'
            ]);

            return;
        }

        $input = json_decode(
            file_get_contents('php://input'),
            true
        );

        $success = $this->model->update(
            $id,
            $input['nim'],
            $input['nama'],
            $input['prodi']
        );

        echo json_encode([
            'success' => $success,
            'message' => $success
                ? 'Mahasiswa berhasil diubah'
                : 'Mahasiswa gagal diubah'
        ]);
    }

    // DELETE /api/mahasiswa/{id}
    public function destroy(int $id): void
    {
        $existing = $this->model->getById($id);

        if (!$existing) {
            http_response_code(404);

            echo json_encode([
                'success' => false,
                'message' => 'Data mahasiswa tidak ditemukan'
            ]);

            return;
        }

        $success = $this->model->delete($id);

        echo json_encode([
            'success' => $success,
            'message' => $success
                ? 'Mahasiswa berhasil dihapus'
                : 'Mahasiswa gagal dihapus'
        ]);
    }
}