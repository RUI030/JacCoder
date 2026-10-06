import from main { count_consecutive_sums }

test "case 0" {
    want = 4;
    got = count_consecutive_sums(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = count_consecutive_sums(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = count_consecutive_sums(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = count_consecutive_sums(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = count_consecutive_sums(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = count_consecutive_sums(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
