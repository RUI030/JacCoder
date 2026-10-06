import from main { can_split_to_two_non_decreasing_subarrays }

test "case 0" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = can_split_to_two_non_decreasing_subarrays([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([1, 3, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = can_split_to_two_non_decreasing_subarrays([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([1, 2, 3, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([3, 3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([10, 10, 1, 1, 1, 1, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([2, 1, 3, 5, 6, 4, 8, 9, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = can_split_to_two_non_decreasing_subarrays([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = can_split_to_two_non_decreasing_subarrays([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([100, 1, 100, 1, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = can_split_to_two_non_decreasing_subarrays([2, 2, 2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
