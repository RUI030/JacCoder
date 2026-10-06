import from main { max_contiguous_empty_groups }

test "case 0" {
    want = 4;
    got = max_contiguous_empty_groups(7, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = max_contiguous_empty_groups(8, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = max_contiguous_empty_groups(10, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = max_contiguous_empty_groups(5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = max_contiguous_empty_groups(9, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = max_contiguous_empty_groups(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = max_contiguous_empty_groups(5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = max_contiguous_empty_groups(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
