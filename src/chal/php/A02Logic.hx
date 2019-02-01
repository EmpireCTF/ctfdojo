package chal.php;

class A02Logic extends Base {
  public function new() {
    super("02-logic");
    mainPHP = '<?php
include "flag.php"; // defines $$FLAG and $$PASS

// for performance reasons check if NOT correctly logged in first
if ($$_GET["username"] != "admin" && $$_GET["password"] != $$PASS) {
  highlight_file(__FILE__);
} else {
  echo $$FLAG;
}
';
    secretPHP = '$$PASS = "hah_what_a_P4SS";
';
    flag = "emp_mr_de_m0rg4n";
  }
}
