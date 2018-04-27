<?php
   class MyDB1 extends SQLite3 {
      function __construct() {
         $this->open('accounts.db');
      }
   }

   $db1 = new MyDB1();
   if(!$db1) {
      echo $db1->lastErrorMsg();
   } else {
      echo "\n";
   }

   $sql =<<<EOF
      SELECT * from ACCOUNTS;
EOF;

   $ret = $db1->query($sql);
   while($row = $ret->fetchArray(SQLITE3_ASSOC) ) {
      echo "ID = ". $row['BANKACCOUNT'] . "\n";
      echo "NAME = ". $row['BALANCE'] ."\n";
      echo "ADDRESS = ". $row['PASSWORD'] ."\n";
   }
   echo "Operation done successfully\n";
   $db1->close();
?>
