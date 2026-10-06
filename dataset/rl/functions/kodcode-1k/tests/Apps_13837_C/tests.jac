import from main { sum_two_smallest_numbers }

test "case 0" {
    want = 7;
    got = sum_two_smallest_numbers([19, 5, 42, 2, 77]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 7;
    got = sum_two_smallest_numbers([10, 343, 5, 1000, 20, 7, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 61;
    got = sum_two_smallest_numbers([345, 674, 121, 1000, 432, 608, 19, 42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = sum_two_smallest_numbers([20, 50, 77, 1000, 5, 10, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = sum_two_smallest_numbers([1, 3, 6, 45, 7, 10, 2, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = sum_two_smallest_numbers([2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
