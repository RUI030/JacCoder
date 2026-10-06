import from main { top_1 }

test "case 0" {
    want = [1, 2];
    got = top_1([1, 1, 2, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5];
    got = top_1([5, 5, 5, 1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = top_1([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = top_1([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 4];
    got = top_1([1, 2, 3, 3, 3, 4, 4, 4, 5, 6, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [7];
    got = top_1([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [7];
    got = top_1([7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [4, 5];
    got = top_1([1, 2, 3, 4, 4, 5, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
