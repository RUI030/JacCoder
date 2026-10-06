import from main { add_polynomials }

test "case 0" {
    want = [4, 2, 3];
    got = add_polynomials([3, 0, 2], [1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 0, 2, 0, 5];
    got = add_polynomials([2, 3, 0, 0, 5], [1, -3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = add_polynomials([0, 0, 0], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3];
    got = add_polynomials([1, 2, 3], [0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0];
    got = add_polynomials([0, 0, 0], [0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0];
    got = add_polynomials([-1, -2, -3], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4000000000, 6000000000];
    got = add_polynomials([1000000000, 2000000000], [3000000000, 4000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
