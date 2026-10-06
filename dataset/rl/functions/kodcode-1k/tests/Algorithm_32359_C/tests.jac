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
    want = '4321';
    got = remove_k_digits('7654321', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '12345';
    got = remove_k_digits('12345', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '0';
    got = remove_k_digits('12345', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '11';
    got = remove_k_digits('112', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '200';
    got = remove_k_digits('100200', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '210';
    got = remove_k_digits('543210', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
