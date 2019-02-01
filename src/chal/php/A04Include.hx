package chal.php;

class A04Include extends Base {
  public function new() {
    super("04-include");
    mainPHP = '<?php
include "flag.php";

// hghlghtr.io - syntax highlight your PHP files®™!
// 
// This is a demo version of our amazing new product.
// Simply go to /?file=example to highlight one of the sample files!
// Available samples: example, hello, arrays

$$target = __FILE__;
if (isset($$_GET["file"])) {
  $$target = "samples/" . $$_GET["file"] . ".php";
}

highlight_file($$target);
';
    flag = "emp_rem0te_f1le_inclus10n";
  }
  
  override public function up():Void {
    super.up();
    if (!js.node.Fs.existsSync(Config.php.tmpDir + "/samples")) js.node.Fs.mkdirSync(Config.php.tmpDir + "/samples");
    createPHP("samples/example.php", '<?php
// comments
$$variables = "strings";
$$numbers = 1;
');
    createPHP("samples/hello.php", '<?php
echo "Hello world!";
');
    createPHP("samples/arrays.php", '<?php
$$myArray = array(1, 2, 3);
$$prettierArray = [4, 5, 6];
$$associative = [
  "foo" => "bar",
  "fizz" => "buzz"
];
');
  }
}
