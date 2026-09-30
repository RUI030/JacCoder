import from main { int_to_roman }

test "one" { assert int_to_roman(1) == "I"; }
test "four and nine" { assert int_to_roman(49) == "XLIX"; }
test "year" { assert int_to_roman(1994) == "MCMXCIV"; }
test "max" { assert int_to_roman(3999) == "MMMCMXCIX"; }
test "four hundred" { assert int_to_roman(400) == "CD"; }
