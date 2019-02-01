package chal.php;

class A03Encode extends Base {
  public function new() {
    super("03-encode");
    mainPHP = '<?php
include "flag.php"; // defines $$FLAG

function xorStr($$key, $$data) {
  $$out = "";
  for ($$i = 0; $$i < strlen($$data); $$i++) $$out .= $$data[$$i] ^ $$key[$$i % strlen($$key)];
  return $$out;
}

// function superSecureEncode not included to discourage hacking attempts!

function superSecureDecode($$data) {
  return base64_decode(xorStr("alakazam!", base64_decode(strrev($$data))));
}

if ($$_GET["password"] == superSecureDecode("UoiNDRxNIBQAnsCA")) {
  echo $$FLAG;
} else {
  highlight_file(__FILE__);
}
';
    flag = "emp_symmetric_0per4tion";
  }
}
