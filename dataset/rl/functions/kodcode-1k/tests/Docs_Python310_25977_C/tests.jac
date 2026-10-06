import from main { custom_slice }

test "case 0" {
    want = [2, 3, 4];
    got = custom_slice([1, 2, 3, 4, 5], 1, 4, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = custom_slice([], 0, 3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = custom_slice([], 0, 0, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = custom_slice([], -3, 3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10, 30, 50];
    got = custom_slice([10, 20, 30, 40, 50], 0, 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [20, 30, 40, 50];
    got = custom_slice([10, 20, 30, 40, 50], 1, 10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [50, 40, 30];
    got = custom_slice([10, 20, 30, 40, 50], 4, 1, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [10, 20, 30, 40];
    got = custom_slice([10, 20, 30, 40, 50], -5, -1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [50, 40, 30, 20];
    got = custom_slice([10, 20, 30, 40, 50], -1, -5, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [1, 3, 5];
    got = custom_slice([1, 2, 3, 4, 5], 0, 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [1, 4];
    got = custom_slice([1, 2, 3, 4, 5], 0, 5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = [1, 5];
    got = custom_slice([1, 2, 3, 4, 5], 0, 5, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
