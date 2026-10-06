import from main { simulate_balloon_falls }

test "case 0" {
    want = [];
    got = simulate_balloon_falls([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5];
    got = simulate_balloon_falls([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3, 6, 10];
    got = simulate_balloon_falls([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 0, 0, 0];
    got = simulate_balloon_falls([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 2, 2, 6, 7];
    got = simulate_balloon_falls([0, 2, 0, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
