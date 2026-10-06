import from main { num_unique_bst }

test "case 0" {
    want = 1;
    got = num_unique_bst(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = num_unique_bst(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = num_unique_bst(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = num_unique_bst(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 14;
    got = num_unique_bst(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 42;
    got = num_unique_bst(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 132;
    got = num_unique_bst(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 429;
    got = num_unique_bst(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 477638700;
    got = num_unique_bst(18);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1767263190;
    got = num_unique_bst(19);
    assert got == want, f"expected={want!r} actual={got!r}";
}
