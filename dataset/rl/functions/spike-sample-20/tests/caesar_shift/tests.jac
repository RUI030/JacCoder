import from main { caesar_shift }

test "negative shift" { assert caesar_shift("bcd", -1) == "abc"; }
test "large shift" { assert caesar_shift("xyz", 29) == "abc"; }
test "mixed case and digits" { assert caesar_shift("Hello, World 42", 3) == "Khoor, Zruog 42"; }
test "zero shift" { assert caesar_shift("Same", 0) == "Same"; }
test "empty" { assert caesar_shift("", 5) == ""; }
test "full negative wrap" { assert caesar_shift("A", -27) == "Z"; }
