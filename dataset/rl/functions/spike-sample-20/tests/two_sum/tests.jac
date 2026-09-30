import from main { two_sum }

test "no pair" { assert two_sum([1, 2, 3], 100) == []; }
test "empty list" { assert two_sum([], 0) == []; }
test "negatives" { assert two_sum([-3, 4, 3, 90], 0) == [0, 2]; }
test "duplicates" { assert two_sum([5, 5, 5], 10) == [0, 1]; }
test "smallest j wins" { assert two_sum([1, 8, 3, 6, 2], 9) == [0, 1]; }
test "not same index twice" { assert two_sum([4, 1], 8) == []; }
