import from main { find_unique_element }

test "case 0" {
    want = 42;
    got = find_unique_element([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = find_unique_element([2, 3, 5, 2, 3, 6, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = find_unique_element([1, 1, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 20;
    got = find_unique_element([10, 10, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = find_unique_element([7, 7, 8, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -3;
    got = find_unique_element([-1, -1, -2, -3, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -7;
    got = find_unique_element([-5, -6, -6, -5, -7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = find_unique_element([1, -1, 1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = find_unique_element([0, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
