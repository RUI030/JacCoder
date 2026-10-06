import from main { find_max_length }

test "case 0" {
    want = 2;
    got = find_max_length([0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = find_max_length([0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 8;
    got = find_max_length([0, 1, 0, 1, 0, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 8;
    got = find_max_length([1, 1, 1, 1, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = find_max_length([1, 0, 1, 0, 1, 1, 0, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = find_max_length([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = find_max_length([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 8;
    got = find_max_length([0, 1, 1, 0, 1, 1, 0, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = find_max_length([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = find_max_length([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
