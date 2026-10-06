import from main { is_perfect_square }

test "case 0" {
    want = True;
    got = is_perfect_square(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_perfect_square(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_perfect_square(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_perfect_square(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_perfect_square(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_perfect_square(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_perfect_square(9801);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_perfect_square(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_perfect_square(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_perfect_square(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = is_perfect_square(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = is_perfect_square(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = is_perfect_square(9999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_perfect_square(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = is_perfect_square(-4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = is_perfect_square(-16);
    assert got == want, f"expected={want!r} actual={got!r}";
}
