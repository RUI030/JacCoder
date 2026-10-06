import from main { filter_and_square_evens }

test "case 0" {
    want = [4, 16, 36];
    got = filter_and_square_evens([2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 16, 36];
    got = filter_and_square_evens([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = filter_and_square_evens([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = filter_and_square_evens([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [16];
    got = filter_and_square_evens([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = filter_and_square_evens([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
