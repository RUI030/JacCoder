import from main { max_sum_alice }

test "case 0" {
    want = 1;
    got = max_sum_alice(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = max_sum_alice(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = max_sum_alice(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = max_sum_alice(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = max_sum_alice(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 12;
    got = max_sum_alice(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}
