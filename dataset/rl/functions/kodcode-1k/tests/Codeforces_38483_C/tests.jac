import from main { max_total_power }

test "case 0" {
    want = [30];
    got = max_total_power(1, [(3, [7, 4, 10, 0, 4, 5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [30, 31];
    got = max_total_power(2, [(3, [7, 4, 10, 0, 4, 5]), (4, [5, 0, 0, 3, 7, 4, 10, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2000];
    got = max_total_power(1, [(1, [1000, 1000])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [10, 21];
    got = max_total_power(2, [(2, [0, 0, 5, 5]), (3, [7, 0, 7, 0, 7, 0])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [15];
    got = max_total_power(1, [(4, [3, 4, 0, 0, 6, 0, 0, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
