import from main { process_list }

test "case 0" {
    want = [4, 16, 36];
    got = process_list([2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 5];
    got = process_list([1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 4, 3, 16];
    got = process_list([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = process_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4];
    got = process_list([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = process_list([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 16];
    got = process_list([-2, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-1, -3];
    got = process_list([-1, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [4, 3, 16, 5, 36];
    got = process_list([-2, 3, -4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
