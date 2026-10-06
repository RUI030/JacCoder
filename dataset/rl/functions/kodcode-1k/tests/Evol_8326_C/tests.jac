import from main { process_numbers }

test "case 0" {
    want = [4, 16, 36];
    got = process_numbers([2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 27, 125];
    got = process_numbers([1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 4, 27, 16, 125];
    got = process_numbers([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = process_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-1, 4, -27, 16, 0];
    got = process_numbers([-1, -2, -3, -4, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4];
    got = process_numbers([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [27];
    got = process_numbers([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
