<?php
   class MyDB extends SQLite3 {
      function __construct() {
         $this->open('accounts.db');
      }
   }
   $db = new MyDB();
   if(!$db) {
      echo $db->lastErrorMsg();
   } else {
      echo "Opened database successfully\n";
   }

   $sql =<<<EOF
      CREATE TABLE ACCOUNTS
      (
      BANKACCOUNT  INT PRIMARY KEY       NOT NULL,
      BALANCE        INT     NOT NULL,
      PASSWORD         CHAR(20))    ;
EOF;

   $ret = $db->exec($sql);
   if(!$ret){
      echo $db->lastErrorMsg();
   } else {
      echo "Table created successfully\n";
   }
   $db->close();
?>
