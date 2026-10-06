import from main { average_speed }

test "case 0" {
    want = 10;
    got = average_speed([10, 20, 30], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 25;
    got = average_speed([50], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = average_speed([5, 10, 15], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 500;
    got = average_speed([1000, 2000, 3000], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = average_speed([5, 9], [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = average_speed([1, 2], [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
