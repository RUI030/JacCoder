import from main { count_ways }

test "case 0" {
    want = 10;
    got = count_ways(5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 35;
    got = count_ways(7, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = count_ways(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = count_ways(5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 20;
    got = count_ways(6, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 210;
    got = count_ways(10, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
