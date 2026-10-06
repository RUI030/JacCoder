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
    want = 1;
    got = unique_paths(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = unique_paths(2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 28;
    got = unique_paths(7, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 48620;
    got = unique_paths(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 22750883079422934966181954039568885395604168260154104734000;
    got = unique_paths(100, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
