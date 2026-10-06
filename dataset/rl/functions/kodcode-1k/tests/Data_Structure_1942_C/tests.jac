import from main { next_higher_number }

test "case 0" {
    want = 38627;
    got = next_higher_number(38276);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 12354;
    got = next_higher_number(12345);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 536479;
    got = next_higher_number(534976);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2431;
    got = next_higher_number(2413);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = next_higher_number(54321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = next_higher_number(99999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = next_higher_number(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = next_higher_number(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 201;
    got = next_higher_number(120);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = next_higher_number(111);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = -1;
    got = next_higher_number(22);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = -1;
    got = next_higher_number(9876543210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 1234567908;
    got = next_higher_number(1234567890);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = -1;
    got = next_higher_number(21);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 21;
    got = next_higher_number(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}
