import from main { count_divisibles }

test "case 0" {
    want = 5;
    got = count_divisibles(1, 10, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = count_divisibles(20, 30, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = count_divisibles(5, 15, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = count_divisibles(100, 200, 25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = count_divisibles(1, 2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = count_divisibles(1, 1000000000, 1000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_divisibles(1, 10, 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = count_divisibles(10, 10, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = count_divisibles(10, 10, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
