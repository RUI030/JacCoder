import from main { find_single_element }

test "case 0" {
    want = 5;
    got = find_single_element([2, 1, 4, 5, 2, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 7;
    got = find_single_element([3, 3, 7, 9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 20;
    got = find_single_element([10, 20, 10, 30, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_single_element([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = find_single_element([0, 0, -1, -2, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
