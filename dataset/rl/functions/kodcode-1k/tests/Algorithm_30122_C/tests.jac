import from main { circular_array_rotation }

test "case 0" {
    want = [4, 5, 1, 2, 3];
    got = circular_array_rotation([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = circular_array_rotation([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 5, 1, 2, 3];
    got = circular_array_rotation([1, 2, 3, 4, 5], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = circular_array_rotation([1], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = circular_array_rotation([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3];
    got = circular_array_rotation([1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3];
    got = circular_array_rotation([1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [3, 4, 1, 2];
    got = circular_array_rotation([1, 2, 3, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}
