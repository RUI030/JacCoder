import from main { count_paths }

test "case 0" {
    want = 28;
    got = count_paths(3, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = count_paths(3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 28;
    got = count_paths(7, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = count_paths(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 20;
    got = count_paths(4, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 84;
    got = count_paths(4, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = count_paths(1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = count_paths(10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
