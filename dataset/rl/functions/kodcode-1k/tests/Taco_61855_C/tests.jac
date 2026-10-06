import from main { find_highest_congestion_stop }

test "case 0" {
    want = 5;
    got = find_highest_congestion_stop(1, [[5, 5, 10, 15, 20, 25]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = find_highest_congestion_stop(3, [[3, 1, 2, 3], [4, 2, 3, 4, 5], [2, 3, 6]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = find_highest_congestion_stop(2, [[3, 10, 20, 30], [4, 10, 20, 25, 30]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_highest_congestion_stop(2, [[2, 1, 2], [2, 3, 4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = find_highest_congestion_stop(3, [[3, 5, 10, 15], [2, 5, 10], [2, 10, 20]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
