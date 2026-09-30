import from main { compress_ranges }

test "empty" { assert compress_ranges([]) == ""; }
test "single" { assert compress_ranges([4]) == "4"; }
test "one run" { assert compress_ranges([0, 1, 2, 3]) == "0-3"; }
test "negatives" { assert compress_ranges([-3, -2, 0, 2, 3]) == "-3--2,0,2-3"; }
test "no runs" { assert compress_ranges([1, 3, 5]) == "1,3,5"; }
