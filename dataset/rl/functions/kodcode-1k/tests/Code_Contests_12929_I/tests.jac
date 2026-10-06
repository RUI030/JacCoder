import from main { reconstruct_list }

test "case 0" {
    want = [1, 3, 6, 10];
    got = reconstruct_list(5, [3, 1, 2, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 8, 16, 26];
    got = reconstruct_list(6, [10, 5, 8, 3, 8, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2];
    got = reconstruct_list(4, [2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 500001, 1500001];
    got = reconstruct_list(7, [0, 1000000, 500000, 0, 1000000, 500000, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [7];
    got = reconstruct_list(5, [7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 3, 6];
    got = reconstruct_list(5, [1, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
