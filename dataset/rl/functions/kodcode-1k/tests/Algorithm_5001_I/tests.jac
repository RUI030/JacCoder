import from main { unique_paths }

test "case 0" {
    want = 28;
    got = unique_paths(3, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = unique_paths(3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 28;
    got = unique_paths(7, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = unique_paths(3, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = unique_paths(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = unique_paths(2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = unique_paths(2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = unique_paths(3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 48620;
    got = unique_paths(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 35345263800;
    got = unique_paths(20, 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = unique_paths(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = unique_paths(1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 1;
    got = unique_paths(2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 1;
    got = unique_paths(100, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 1;
    got = unique_paths(1, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 1;
    got = unique_paths(10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 1;
    got = unique_paths(1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
