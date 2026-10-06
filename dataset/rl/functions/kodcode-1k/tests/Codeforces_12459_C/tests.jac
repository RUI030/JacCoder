import from main { calculate_score }

test "case 0" {
    want = 475.0;
    got = calculate_score(5, 2.5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 250.0;
    got = calculate_score(3, 5.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0.0;
    got = calculate_score(2, 30.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0.0;
    got = calculate_score(0, 10.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 990.0;
    got = calculate_score(10, 1.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 800;
    got = calculate_score(8, 0.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0.0;
    got = calculate_score(0, 0.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
