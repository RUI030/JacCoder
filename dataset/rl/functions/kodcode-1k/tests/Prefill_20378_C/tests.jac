import from main { count_ones_in_binary }

test "case 0" {
    want = 1;
    got = count_ones_in_binary(8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = count_ones_in_binary(13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = count_ones_in_binary(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = count_ones_in_binary(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = count_ones_in_binary(1023);
    assert got == want, f"expected={want!r} actual={got!r}";
}
