import from main { next_greater_element }

test "case 0" {
    want = [2, -1];
    got = next_greater_element([4, 1, 2], [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [-1];
    got = next_greater_element([4, 1, 2], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4];
    got = next_greater_element([2, 4], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [-1];
    got = next_greater_element([2, 4], [4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 4, -1, -1];
    got = next_greater_element([1, 3, 4, 2], [1, 3, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [6, 6, -1];
    got = next_greater_element([1, 5, 3, 6, 4, 2], [5, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [5, 3];
    got = next_greater_element([1, 3, 1, 3, 5], [3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
