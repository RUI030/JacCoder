import from main { find_single_element }

test "case 0" {
    want = 4;
    got = find_single_element([5, 3, 4, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = find_single_element([0, 1, 1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10000000;
    got = find_single_element([1000000, 10000000, 1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = find_single_element([7, 9, 3, 9, 7, 9, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 42;
    got = find_single_element([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
