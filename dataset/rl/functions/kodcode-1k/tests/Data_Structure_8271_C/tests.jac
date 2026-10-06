import from main { first_occurrence }

test "case 0" {
    want = 3;
    got = first_occurrence([1, 2, 2, 4, 4, 4, 7, 8, 9, 9], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = first_occurrence([1, 2, 2, 4, 4, 4, 7, 8, 9, 9], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 8;
    got = first_occurrence([1, 2, 2, 4, 4, 4, 7, 8, 9, 9], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = first_occurrence([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = first_occurrence([5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = first_occurrence([], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = first_occurrence([2, 2, 2, 2, 2], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = first_occurrence([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = first_occurrence([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
