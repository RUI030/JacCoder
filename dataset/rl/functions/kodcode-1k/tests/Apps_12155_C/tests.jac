import from main { digital_root }

test "case 0" {
    want = 7;
    got = digital_root(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = digital_root(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = digital_root(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = digital_root(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = digital_root(29);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = digital_root(47);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 6;
    got = digital_root(942);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = digital_root(132189);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = digital_root(493193);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 9;
    got = digital_root(123456789);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 9;
    got = digital_root(987654321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 9;
    got = digital_root(999999999);
    assert got == want, f"expected={want!r} actual={got!r}";
}
