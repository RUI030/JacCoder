import from main { efficient_phi }

test "case 0" {
    want = 1;
    got = efficient_phi(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = efficient_phi(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = efficient_phi(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = efficient_phi(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = efficient_phi(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = efficient_phi(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 12;
    got = efficient_phi(13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 28;
    got = efficient_phi(29);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = efficient_phi(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 8;
    got = efficient_phi(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 12;
    got = efficient_phi(21);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 400000;
    got = efficient_phi(1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 999982;
    got = efficient_phi(999983);
    assert got == want, f"expected={want!r} actual={got!r}";
}
