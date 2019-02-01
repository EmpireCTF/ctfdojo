package chal.php;

class A01Simple extends Base {
  public function new() {
    super("01-simple");
    mainPHP = '<?php
include "flag.php"; // defines $$FLAG

if ($$_GET["password"] == "swordfish") {
  echo $$FLAG;
} else {
  highlight_file(__FILE__);
}
';
    flag = "emp_php_1s_b357_langu4ge";
  }
}
