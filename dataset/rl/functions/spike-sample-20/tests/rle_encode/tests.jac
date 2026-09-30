import from main { rle_encode }

test "empty string" { assert rle_encode("") == ""; }
test "no repeats" { assert rle_encode("abc") == "1a1b1c"; }
test "long run" { assert rle_encode("zzzzzzzzzzzz") == "12z"; }
test "runs separated" { assert rle_encode("aaXaa") == "2a1X2a"; }
test "spaces count" { assert rle_encode("  b") == "2 1b"; }
