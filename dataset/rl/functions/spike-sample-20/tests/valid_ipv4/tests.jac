import from main { valid_ipv4 }

test "all zeros" { assert valid_ipv4("0.0.0.0") == True; }
test "max values" { assert valid_ipv4("255.255.255.255") == True; }
test "leading zero" { assert valid_ipv4("10.01.0.1") == False; }
test "three parts" { assert valid_ipv4("1.2.3") == False; }
test "empty part" { assert valid_ipv4("1..2.3") == False; }
test "letters" { assert valid_ipv4("1.2.a.4") == False; }
test "sign rejected" { assert valid_ipv4("1.2.-3.4") == False; }
