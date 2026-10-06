import from main { sum_excluding_elements }

test "case 0" {
    want = 6;
    got = sum_excluding_elements([2, 1, 4, 5, 2, 4], [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = sum_excluding_elements([0, 3, 1, 0, 1], [0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 29;
    got = sum_excluding_elements([5, 8, 13, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = sum_excluding_elements([7, 5, 7, 10], [7, 5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = sum_excluding_elements([2, 1, 4, 5, 2, 4], [4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = sum_excluding_elements([1, 1, 1, 1, 1], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 15;
    got = sum_excluding_elements([4, 5, 6], [7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
