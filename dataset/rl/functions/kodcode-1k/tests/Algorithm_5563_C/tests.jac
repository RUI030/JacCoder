import from main { evaluate_polynomial }

test "case 0" {
    want = 17;
    got = evaluate_polynomial([3, 2, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = evaluate_polynomial([4, -1, 2, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = evaluate_polynomial([2, 0, 5], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 20;
    got = evaluate_polynomial([1, -3, 2], -3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = evaluate_polynomial([5, 4, 3, 2, 1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1000000000001;
    got = evaluate_polynomial([1, 0, 1], 1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -14;
    got = evaluate_polynomial([-3, 0, -2], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
