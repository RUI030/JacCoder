import from main { merge_intervals }

test "empty" { assert merge_intervals([]) == []; }
test "unsorted input" { assert merge_intervals([[8, 9], [1, 4], [2, 3]]) == [[1, 4], [8, 9]]; }
test "touching merge" { assert merge_intervals([[1, 2], [2, 3]]) == [[1, 3]]; }
test "contained" { assert merge_intervals([[1, 10], [2, 3], [4, 5]]) == [[1, 10]]; }
test "disjoint" { assert merge_intervals([[5, 6], [1, 2]]) == [[1, 2], [5, 6]]; }
test "chain" { assert merge_intervals([[1, 3], [6, 9], [2, 7]]) == [[1, 9]]; }
