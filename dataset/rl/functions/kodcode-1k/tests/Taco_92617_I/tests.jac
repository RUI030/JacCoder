import from main { is_square_free }

test "case 0" {
    want = 'YES';
    got = is_square_free(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = is_square_free(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_square_free(17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = is_square_free(33);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = is_square_free(997);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = is_square_free(18);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = is_square_free(25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'NO';
    got = is_square_free(49);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = is_square_free(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'NO';
    got = is_square_free(121);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'YES';
    got = is_square_free(999983);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'NO';
    got = is_square_free(1024);
    assert got == want, f"expected={want!r} actual={got!r}";
}
