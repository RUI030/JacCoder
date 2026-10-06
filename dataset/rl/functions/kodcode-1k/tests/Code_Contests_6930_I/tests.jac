import from main { count_ways }

test "case 0" {
    want = 12;
    got = count_ways(5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 7;
    got = count_ways(4, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = count_ways(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 55;
    got = count_ways(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 11;
    got = count_ways(6, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 26;
    got = count_ways(8, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
