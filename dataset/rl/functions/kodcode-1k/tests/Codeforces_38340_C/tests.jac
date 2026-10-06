import from main { length_of_lis }

test "case 0" {
    want = 6;
    got = length_of_lis([10, 20, 10, 30, 40, 50, 60]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = length_of_lis([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = length_of_lis([10, 9, 8, 7, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = length_of_lis([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = length_of_lis([3, 10, 2, 1, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = length_of_lis([3, 4, 5, 1, 2, 3, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
