import from main { count_one_bits }

test "case 0" {
    want = 0;
    got = count_one_bits(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_one_bits(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = count_one_bits(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = count_one_bits(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = count_one_bits(1024);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = count_one_bits(255);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 32;
    got = count_one_bits(4294967295);
    assert got == want, f"expected={want!r} actual={got!r}";
}
