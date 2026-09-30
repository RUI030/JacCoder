import from main { rotate_matrix }

test "empty" { assert rotate_matrix([]) == []; }
test "single cell" { assert rotate_matrix([[7]]) == [[7]]; }
test "three by three" { assert rotate_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [[7, 4, 1], [8, 5, 2], [9, 6, 3]]; }
test "wide rectangle" { assert rotate_matrix([[1, 2, 3], [4, 5, 6]]) == [[4, 1], [5, 2], [6, 3]]; }
test "input untouched" {
    m = [[1, 2], [3, 4]];
    _ = rotate_matrix(m);
    assert m == [[1, 2], [3, 4]];
}
