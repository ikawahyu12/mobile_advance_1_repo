<?php
class Mahasiswa
{
    private PDO $conn;
    public function __construct(PDO $conn)
    {
        $this->conn = $conn;}
    // READ
    public function getAll(): array
    {
        $sql = "SELECT * FROM mahasiswa ORDER BY id DESC";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);}
    // READ BY ID
    public function getById(int $id): ?array
    {
        $sql = "SELECT * FROM mahasiswa WHERE id = :id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            ':id' => $id
        ]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        return $data ?: null;}
    // CREATE
    public function create(
        string $nim,
        string $nama,
        string $prodi
    ): bool {
        $sql = "
            INSERT INTO mahasiswa (nim, nama, prodi)
            VALUES (:nim, :nama, :prodi)";
        $stmt = $this->conn->prepare($sql);
        return $stmt->execute([
            ':nim' => $nim,
            ':nama' => $nama,
            ':prodi' => $prodi]);}
    // UPDATE
    public function update(
        int $id,
        string $nim,
        string $nama,
        string $prodi
    ): bool {
        $sql = "
            UPDATE mahasiswa
            SET nim = :nim,
                nama = :nama,
                prodi = :prodi
            WHERE id = :id";
        $stmt = $this->conn->prepare($sql);
        return $stmt->execute([
            ':id' => $id,
            ':nim' => $nim,
            ':nama' => $nama,
            ':prodi' => $prodi
        ]);}
    // DELETE
    public function delete(int $id): bool
    {
        $sql = "DELETE FROM mahasiswa WHERE id = :id";
        $stmt = $this->conn->prepare($sql);
        return $stmt->execute([
            ':id' => $id
        ]);}}