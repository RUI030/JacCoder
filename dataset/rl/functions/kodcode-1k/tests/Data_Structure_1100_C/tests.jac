import from main { next_bigger_number }

test "case 0" {
    want = 38627;
    got = next_bigger_number(38276);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = next_bigger_number(99999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12354;
    got = next_bigger_number(12345);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = next_bigger_number(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = next_bigger_number(54321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = next_bigger_number(9876543210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 201;
    got = next_bigger_number(120);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1200;
    got = next_bigger_number(1020);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = next_bigger_number(21);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 21;
    got = next_bigger_number(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = -1;
    got = next_bigger_number(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = -1;
    got = next_bigger_number(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 123456798;
    got = next_bigger_number(123456789);
    assert got == want, f"expected={want!r} actual={got!r}";
}
