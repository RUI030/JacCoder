import from main { max_subarray }

test "all negative" { assert max_subarray([-8, -3, -6]) == -3; }
test "single" { assert max_subarray([5]) == 5; }
test "whole array" { assert max_subarray([1, 2, 3]) == 6; }
test "middle run" { assert max_subarray([2, -10, 3, 4, -1, 2, -20, 1]) == 8; }
test "zeros" { assert max_subarray([0, -1, 0]) == 0; }
