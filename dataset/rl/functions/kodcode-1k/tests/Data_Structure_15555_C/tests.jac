import from main { next_higher_number }

test "case 0" {
    want = 38627;
    got = next_higher_number(38276);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = next_higher_number(54321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12354;
    got = next_higher_number(12345);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1528524;
    got = next_higher_number(1528452);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = next_higher_number(999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = next_higher_number(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = next_higher_number(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = next_higher_number(21);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 21;
    got = next_higher_number(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = next_higher_number(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 12223233;
    got = next_higher_number(12222333);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = -1;
    got = next_higher_number(33322211);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = -1;
    got = next_higher_number(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = -1;
    got = next_higher_number(321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 201;
    got = next_higher_number(120);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = -1;
    got = next_higher_number(9876543210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 1234567908;
    got = next_higher_number(1234567890);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = 1234560789;
    got = next_higher_number(1234509876);
    assert got == want, f"expected={want!r} actual={got!r}";
}
