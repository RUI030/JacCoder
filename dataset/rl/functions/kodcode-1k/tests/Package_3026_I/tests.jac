import from main { second_highest }

test "case 0" {
    want = 4;
    got = second_highest([4, 1, 5, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = None;
    got = second_highest([7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 7;
    got = second_highest([10, -1, 2, 10, 7, -1, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = None;
    got = second_highest([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = second_highest([2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = second_highest([3, 1, 2, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = None;
    got = second_highest([1, 1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = None;
    got = second_highest([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = None;
    got = second_highest([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = None;
    got = second_highest([1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = second_highest([1, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = -2;
    got = second_highest([-1, -1, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
