import from main { count_less_than_elements }

test "case 0" {
    want = [2, 0, 1];
    got = count_less_than_elements(3, [3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 2, 1];
    got = count_less_than_elements(3, [1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0];
    got = count_less_than_elements(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 2, 3];
    got = count_less_than_elements(4, [10, 20, 30, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 1, 2, 3, 4];
    got = count_less_than_elements(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4, 3, 2, 1, 0];
    got = count_less_than_elements(5, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [3, 0, 1, 2];
    got = count_less_than_elements(4, [7, -3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2, 0, 1];
    got = count_less_than_elements(3, [1000000, -1000000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
