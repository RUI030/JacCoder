import from main { compute_totients }

test "case 0" {
    want = [1];
    got = compute_totients([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = compute_totients([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 1, 2, 2, 4, 2];
    got = compute_totients([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 20, 12];
    got = compute_totients([10, 25, 36]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [400000];
    got = compute_totients([1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [6, 12, 16];
    got = compute_totients([7, 13, 17]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [8, 8, 24, 16];
    got = compute_totients([15, 30, 45, 60]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
