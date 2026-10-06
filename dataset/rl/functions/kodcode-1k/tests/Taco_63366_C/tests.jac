import from main { remove_k_digits }

test "case 0" {
    want = '1219';
    got = remove_k_digits('1432219', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '200';
    got = remove_k_digits('10200', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '0';
    got = remove_k_digits('10', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '58';
    got = remove_k_digits('7658', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '1234567890';
    got = remove_k_digits('1234567890', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '0';
    got = remove_k_digits('54321', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '200';
    got = remove_k_digits('100200', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '0';
    got = remove_k_digits('100200', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '1111';
    got = remove_k_digits('1111111', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '2222';
    got = remove_k_digits('2222222', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
