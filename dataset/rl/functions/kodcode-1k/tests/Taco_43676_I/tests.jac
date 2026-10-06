import from main { max_total_magical_power }

test "case 0" {
    want = 22;
    got = max_total_magical_power(3, 3, [[2, 1, 7], [3, 5, 4], [6, 10, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_total_magical_power(3, 3, [[1, 1, 1], [1, 1, 1], [1, 1, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 18;
    got = max_total_magical_power(3, 3, [[9, 8, 7], [6, 5, 4], [3, 2, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 200000;
    got = max_total_magical_power(2, 2, [[100000, 99999], [99998, 100000]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = max_total_magical_power(2, 2, [[1, 1], [1, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
