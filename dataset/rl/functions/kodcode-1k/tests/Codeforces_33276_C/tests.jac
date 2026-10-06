import from main { length_of_lis }

test "case 0" {
    want = 4;
    got = length_of_lis([5, 2, 8, 6, 3, 6, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = length_of_lis([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = length_of_lis([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = length_of_lis([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = length_of_lis([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
