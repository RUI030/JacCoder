import from main { second_largest }

test "empty" { assert second_largest([]) is None; }
test "single" { assert second_largest([9]) is None; }
test "max repeated" { assert second_largest([7, 7, 7, 3]) == 3; }
test "negatives" { assert second_largest([-1, -5, -3]) == -3; }
test "unsorted" { assert second_largest([10, 50, 20, 50, 40]) == 40; }
