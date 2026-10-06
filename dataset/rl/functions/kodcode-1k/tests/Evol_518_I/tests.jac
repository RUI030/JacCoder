import from main { process_numbers }

test "case 0" {
    want = [4, 16, 36];
    got = process_numbers([2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 6, 10];
    got = process_numbers([1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 10, 64, 22];
    got = process_numbers([2, 5, 8, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = process_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [16];
    got = process_numbers([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [14];
    got = process_numbers([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
