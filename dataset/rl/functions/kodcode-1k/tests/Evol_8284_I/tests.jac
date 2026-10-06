import from main { square_evens }

test "case 0" {
    want = [4, 16];
    got = square_evens([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [100, 144];
    got = square_evens([10, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = square_evens([1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = square_evens([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4, 16, 36];
    got = square_evens([-2, -4, -6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4, 16, 36];
    got = square_evens([-2, 3, 4, -6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
