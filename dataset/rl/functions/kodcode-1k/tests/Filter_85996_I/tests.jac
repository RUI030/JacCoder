import from main { multiply }

test "case 0" {
    want = 0;
    got = multiply(0, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = multiply(10, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = multiply(1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = multiply(10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = multiply(2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 35;
    got = multiply(5, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 56088;
    got = multiply(123, 456);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2097152;
    got = multiply(1024, 2048);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1000;
    got = multiply(1000, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1000;
    got = multiply(1, 1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
