import from main { is_power_of_two }

test "case 0" {
    want = True;
    got = is_power_of_two(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_power_of_two(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_power_of_two(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_power_of_two(8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_power_of_two(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_power_of_two(32);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_power_of_two(64);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_power_of_two(128);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_power_of_two(256);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_power_of_two(512);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_power_of_two(1024);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = is_power_of_two(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = is_power_of_two(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_power_of_two(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = is_power_of_two(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = is_power_of_two(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = False;
    got = is_power_of_two(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = False;
    got = is_power_of_two(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = False;
    got = is_power_of_two(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 19" {
    want = False;
    got = is_power_of_two(18);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 20" {
    want = False;
    got = is_power_of_two(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 21" {
    want = False;
    got = is_power_of_two(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 22" {
    want = False;
    got = is_power_of_two(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 23" {
    want = False;
    got = is_power_of_two(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 24" {
    want = False;
    got = is_power_of_two(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 25" {
    want = False;
    got = is_power_of_two(-2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 26" {
    want = False;
    got = is_power_of_two(-4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 27" {
    want = False;
    got = is_power_of_two(-8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 28" {
    want = False;
    got = is_power_of_two(-16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 29" {
    want = False;
    got = is_power_of_two(-32);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 30" {
    want = False;
    got = is_power_of_two(-64);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 31" {
    want = False;
    got = is_power_of_two(-128);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 32" {
    want = False;
    got = is_power_of_two(-256);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 33" {
    want = False;
    got = is_power_of_two(-512);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 34" {
    want = False;
    got = is_power_of_two(-1024);
    assert got == want, f"expected={want!r} actual={got!r}";
}
