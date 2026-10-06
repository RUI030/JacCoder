import from main { find_max_square_subgrid }

test "case 0" {
    want = 3;
    got = find_max_square_subgrid(4, 5, ['10111', '10111', '11111', '10010']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = find_max_square_subgrid(3, 3, ['111', '111', '111']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = find_max_square_subgrid(1, 1, ['0']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_max_square_subgrid(1, 1, ['1']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = find_max_square_subgrid(2, 2, ['01', '11']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = find_max_square_subgrid(3, 4, ['1101', '1101', '1111']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = find_max_square_subgrid(6, 6, ['100001', '111111', '111111', '111111', '111111', '111111']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = find_max_square_subgrid(0, 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = find_max_square_subgrid(2, 2, ['00', '00']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
