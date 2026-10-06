import from main { is_sorted_descending }

test "case 0" {
    want = True;
    got = is_sorted_descending([6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_sorted_descending([1, 3, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_sorted_descending([10, 9, 8, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_sorted_descending([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_sorted_descending([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_sorted_descending([3, 2, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_sorted_descending([7, 5, 5, 4, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_sorted_descending([7, 5, 5, 6, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_sorted_descending([5, 4, 3, 3, 2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_sorted_descending([10, 9, 8, 8, 7, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
