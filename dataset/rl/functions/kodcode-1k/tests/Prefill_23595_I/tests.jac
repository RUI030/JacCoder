import from main { list_length }

test "case 0" {
    want = 0;
    got = list_length([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = list_length([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = list_length([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = list_length([-1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = list_length([-1, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
