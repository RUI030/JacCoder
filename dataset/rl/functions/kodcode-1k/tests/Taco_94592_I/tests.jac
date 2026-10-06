import from main { smallestNonRepresentableSum }

test "case 0" {
    want = 16;
    got = smallestNonRepresentableSum(5, [1, 1, 3, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = smallestNonRepresentableSum(3, [1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = smallestNonRepresentableSum(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = smallestNonRepresentableSum(1, [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = smallestNonRepresentableSum(2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = smallestNonRepresentableSum(2, [1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = smallestNonRepresentableSum(2, [2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = smallestNonRepresentableSum(3, [2, 5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = smallestNonRepresentableSum(4, [1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = smallestNonRepresentableSum(5, [100, 200, 300, 400, 500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
