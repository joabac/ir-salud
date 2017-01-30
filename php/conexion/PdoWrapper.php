<?php
include_once 'configdb-prod.php';
class PdoWrapper {
     /** @var PDO */
    private $db = null;

    private $dbhost = DB_HOST;
    private $dbname = DB_NAME;
    private $dbuser = DB_USER;
    private $dbport = DB_PORT;
    private $dbpassword = DB_PASSWORD;
          
    /**
     * @return PDO
     */
    private function getDb() {
        
        if ($this->db !== null) {
            return $this->db;
        }
        try {
            $this->db = new \PDO("pgsql:host={$this->dbhost};dbname={$this->dbname}", $this->dbuser, $this->dbpassword, array(\PDO::ATTR_ERRMODE => \PDO::ERRMODE_WARNING));
            $this->db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            echo 'Falló la conexión: ' . $e->getMessage();
        }
        return $this->db;
    }
    
  
    private static function throwDbError(array $errorInfo) { 
        // TODO log error, send email, etc.
        throw new \Exception('DB error [' . $errorInfo[0] . ', ' . $errorInfo[1] . ']: ' . $errorInfo[2]);
    }
    
    public function initTransaction()
    {
       return $this->getDb()->beginTransaction();

    }
    
    public function commit()
    {
        return $this->getDb()->commit();
    }
      
    public function rollback()
    {
        return $this->getDb()->rollBack();
    }
    
    public function lastInsertId($col)
    {
            return $this->getDb()->lastInsertId($col);
    }
    /**
     * @return PDOStatement
     */
    public function query($sql) 
    {
        $statement = $this->getDb()->query($sql, \PDO::FETCH_ASSOC);
        if ($statement === false) {
            
            self::throwDbError($this->getDb()->errorInfo());
        }

        return $statement;
    }

    
    /**
     * @return lastInsertId
     * @throws Exception
     */
    public function execute($sql, $arrParams) {
       // if(DEBUG) {echo "<br>-DomicilioDao: execute";}
        $statement = $this->getDb()->prepare($sql);
        $this->executeStatement($statement, $arrParams);
        if ($statement === false) {
            self::throwDbError($this->getDb()->errorInfo());
        }
        if ($statement->rowCount() === false) {
            throw new \NotFoundException('Objeto does not exist.');
        }
        return $statement;
    }
    
     private function executeStatement(\PDOStatement $statement, array $params) {
        if (!$statement->execute($params)) {
            //var_dump($statement->errorInfo());
            self::throwDbError($statement->errorInfo());
        }
    }

}
?>