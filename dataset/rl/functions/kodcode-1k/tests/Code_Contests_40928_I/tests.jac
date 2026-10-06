import from main { identify_even_odd }

test "case 0" {
    want = 'EVEN';
    got = identify_even_odd(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'EVEN';
    got = identify_even_odd(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'EVEN';
    got = identify_even_odd(42);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'EVEN';
    got = identify_even_odd(88);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'EVEN';
    got = identify_even_odd(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'ODD';
    got = identify_even_odd(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'ODD';
    got = identify_even_odd(31);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'ODD';
    got = identify_even_odd(77);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'ODD';
    got = identify_even_odd(93);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'ODD';
    got = identify_even_odd(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'ODD';
    got = identify_even_odd(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'EVEN';
    got = identify_even_odd(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
