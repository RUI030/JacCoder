import from main { shuffleArray }

test "case 0" {
    want = [9, 4, 17, 3, 19, 5];
    got = shuffleArray([9, 4, 17, 3, 19, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 1, 3, 4, 5];
    got = shuffleArray([2, 1, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = shuffleArray([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [100];
    got = shuffleArray([100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2];
    got = shuffleArray([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [3, 5];
    got = shuffleArray([3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [100000, 99999, -100000, -99999, 0, -1];
    got = shuffleArray([100000, 99999, -100000, -99999, 0, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2, 3, 4, 5, 6];
    got = shuffleArray([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-5, 0, -3, 1, -1, 2];
    got = shuffleArray([-5, 0, -3, 1, -1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
