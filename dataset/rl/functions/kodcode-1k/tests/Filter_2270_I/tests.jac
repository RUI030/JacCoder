import from main { remove_elements }

test "case 0" {
    want = [11, 12, 20, 13, 25];
    got = remove_elements([11, 12, 20, 13, 25]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = remove_elements([1, 2, 5, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [25, 11, 15];
    got = remove_elements([5, 25, 8, 11, 4, 15, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = remove_elements([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = remove_elements([10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
