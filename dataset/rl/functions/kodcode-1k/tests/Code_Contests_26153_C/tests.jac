import from main { toll_booth }

test "case 0" {
    want = 'FAIL';
    got = toll_booth(5, [2, 1, 2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'SUCCESS';
    got = toll_booth(6, [1, 2, 1, 1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'SUCCESS';
    got = toll_booth(3, [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'FAIL';
    got = toll_booth(3, [2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'SUCCESS';
    got = toll_booth(4, [1, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'FAIL';
    got = toll_booth(3, [2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'SUCCESS';
    got = toll_booth(4, [1, 1, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'SUCCESS';
    got = toll_booth(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}
