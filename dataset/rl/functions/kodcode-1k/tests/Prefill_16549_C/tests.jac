import from main { divisible_by_3_and_5 }

test "case 0" {
    want = [0, 15, 30];
    got = divisible_by_3_and_5(0, 30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = divisible_by_3_and_5(1, 14);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-30, -15];
    got = divisible_by_3_and_5(-30, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [15];
    got = divisible_by_3_and_5(15, 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = divisible_by_3_and_5(14, 14);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = divisible_by_3_and_5(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-30, -15, 0, 15, 30];
    got = divisible_by_3_and_5(-30, 30);
    assert got == want, f"expected={want!r} actual={got!r}";
}
