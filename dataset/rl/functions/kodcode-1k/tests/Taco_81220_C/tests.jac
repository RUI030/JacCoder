import from main { deliveryAnalysis }

test "case 0" {
    want = [1, 10, 4.8];
    got = deliveryAnalysis([3, 6, 1, 10, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [100, 300, 200.0];
    got = deliveryAnalysis([100, 200, 300]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [50, 50, 50.0];
    got = deliveryAnalysis([50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 0, 0.0];
    got = deliveryAnalysis([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [500000, 1000000, 833333.0];
    got = deliveryAnalysis([1000000, 500000, 999999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
