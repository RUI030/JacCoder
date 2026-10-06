import from main { square_evens }

test "case 0" {
    want = [1, 4, 3, 16];
    got = square_evens([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = square_evens([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3, 5];
    got = square_evens([1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 16, 36];
    got = square_evens([2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 4, -3, 5];
    got = square_evens([0, -2, -3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-1, 4, -3, 16];
    got = square_evens([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4];
    got = square_evens([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [3];
    got = square_evens([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1000000000000, 999999, 1000000000000, -999999];
    got = square_evens([1000000, 999999, -1000000, -999999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
