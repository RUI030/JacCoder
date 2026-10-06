import from main { num_trees }

test "case 0" {
    want = 1;
    got = num_trees(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = num_trees(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = num_trees(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = num_trees(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 14;
    got = num_trees(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 42;
    got = num_trees(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 132;
    got = num_trees(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 429;
    got = num_trees(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}
