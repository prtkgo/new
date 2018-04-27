<?php
   class MyDB extends SQLite3 {
      function __construct() {
         $this->open('accounts.db');
      }
   }

   $db = new MyDB();
   if(!$db){
      echo $db->lastErrorMsg();
   } else {
      echo "Opened database successfully\n";
   }
   $sql =<<<EOF
   INSERT INTO ACCOUNTS (BANKACCOUNT,BALANCE,PASSWORD)
   VALUES (11119,900,'asaaaa' );




EOF;

try{
//error handler function
function customError($errno, $errstr) {
  if($errno == 2){
      // echo "string";
      throw new Exception("");

  }
}

//set error handler
set_error_handler("customError");
$ret = $db->exec($sql);

//trigger error

}
catch (Exception $e) {
   echo "Already added" ;
}
   if(!$ret) {
      // echo $db->lastErrorMsg();
   } else {
      echo "Added successfully\n";
   }
   $db->close();
?>
