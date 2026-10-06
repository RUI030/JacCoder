import from main { get_unique_elements }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = get_unique_elements([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 5];
    got = get_unique_elements([1, 2, 2, 3, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = get_unique_elements([1, 1, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [7, 8, 9];
    got = get_unique_elements([4, 5, 6, 5, 4, 6, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = get_unique_elements([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [10];
    got = get_unique_elements([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = get_unique_elements([10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
