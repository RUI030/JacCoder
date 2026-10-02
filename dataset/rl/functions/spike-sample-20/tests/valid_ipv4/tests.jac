import from main { valid_ipv4 }

test "all zeros" {
    want = True;
    got = valid_ipv4("0.0.0.0");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "max values" {
    want = True;
    got = valid_ipv4("255.255.255.255");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "leading zero" {
    want = False;
    got = valid_ipv4("10.01.0.1");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "three parts" {
    want = False;
    got = valid_ipv4("1.2.3");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "empty part" {
    want = False;
    got = valid_ipv4("1..2.3");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "letters" {
    want = False;
    got = valid_ipv4("1.2.a.4");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "sign rejected" {
    want = False;
    got = valid_ipv4("1.2.-3.4");
    assert got == want, f"expected={want!r} actual={got!r}";
}
