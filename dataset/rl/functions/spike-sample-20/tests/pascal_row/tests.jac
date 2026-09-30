import from main { pascal_row }

test "row one" { assert pascal_row(1) == [1, 1]; }
test "row five" { assert pascal_row(5) == [1, 5, 10, 10, 5, 1]; }
test "row ten middle" { assert pascal_row(10)[5] == 252; }
test "row twenty length" { assert len(pascal_row(20)) == 21; }
test "row thirty sum" { assert sum(pascal_row(30)) == 2 ** 30; }
