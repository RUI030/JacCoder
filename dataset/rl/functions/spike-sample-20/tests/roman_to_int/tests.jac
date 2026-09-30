import from main { roman_to_int }

test "four" { assert roman_to_int("IV") == 4; }
test "nineteen ninety four" { assert roman_to_int("MCMXCIV") == 1994; }
test "max" { assert roman_to_int("MMMCMXCIX") == 3999; }
test "one" { assert roman_to_int("I") == 1; }
test "forty four" { assert roman_to_int("XLIV") == 44; }
