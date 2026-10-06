import from main { max_jumpable_logs }

test "case 0" {
    want = 3;
    got = max_jumpable_logs(5, [1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_jumpable_logs(3, [2, 2, 2], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = max_jumpable_logs(4, [1, 6, 2, 5], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_jumpable_logs(1, [10], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = max_jumpable_logs(1, [10], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = max_jumpable_logs(4, [1, 2, 3, 4], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_jumpable_logs(4, [5, 6, 7, 8], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = max_jumpable_logs(6, [3, 2, 5, 1, 6, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
