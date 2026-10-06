<?php
class Database
{
    private string $host = 'localhost';
    private string $db_name = 'acara_41';
    private string $username = 'root';
    private string $password = '';
    public function connect(): PDO
    {
        try {
            $conn = new PDO(
                "mysql:host={$this->host};dbname={$this->db_name};charset=utf8mb4",
                $this->username,
                $this->password
            );

            $conn->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );
            return $conn;
        } catch (PDOException $e) {
            http_response_code(500);
            die(json_encode([
                'success' => false,
                'message' => 'Database connection failed',
                'error' => $e->getMessage()
            ]));
        }
    }
}