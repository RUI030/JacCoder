import from main { find_difference }

test "case 0" {
    want = 4;
    got = find_difference([5, 2, 3, 7, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = find_difference([9, 8, 3, 6, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1000;
    got = find_difference([1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 500;
    got = find_difference([1000, 500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = find_difference([6, 6, 6, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = find_difference([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = find_difference([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
