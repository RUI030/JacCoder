import from main { count_common_volunteers }

test "case 0" {
    want = 0;
    got = count_common_volunteers(3, [1, 2, 3], 3, [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = count_common_volunteers(4, [1, 2, 3, 4], 4, [3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = count_common_volunteers(3, [1, 2, 3], 3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = count_common_volunteers(0, [], 3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = count_common_volunteers(3, [1, 2, 3], 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = count_common_volunteers(0, [], 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = count_common_volunteers(5, [1, 2, 2, 3, 4], 5, [4, 4, 5, 6, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
