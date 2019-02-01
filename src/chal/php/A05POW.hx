package chal.php;

class A05POW extends Base {
  public function new() {
    super("05-pow");
    mainPHP = '<?php
include "flag.php"; // defines $$FLAG

// some work for you
$$target = "dead";
$$prefix = "ctf-23-01-19-";

if (substr(md5($$prefix . $$_GET["password"]), 0, 4) === $$target) {
  echo $$FLAG;
} else {
  highlight_file(__FILE__);
}
';
    flag = "emp_n0w_d0_it_0n_7he_bl0ckchain";
  }
}
