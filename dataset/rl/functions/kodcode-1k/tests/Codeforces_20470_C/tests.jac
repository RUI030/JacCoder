import from main { longest_beautiful_view }

test "case 0" {
    want = 7;
    got = longest_beautiful_view([1, 2, 3, 4, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_beautiful_view([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = longest_beautiful_view([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_beautiful_view([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = longest_beautiful_view([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_beautiful_view([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = longest_beautiful_view([2, 1, 4, 7, 3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_beautiful_view([2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = longest_beautiful_view([0, 1, 0, 1, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 7;
    got = longest_beautiful_view([2, 4, 6, 8, 6, 4, 2, 2, 5, 6, 7, 4, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 5;
    got = longest_beautiful_view([3, 3, 3, 1, 2, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
