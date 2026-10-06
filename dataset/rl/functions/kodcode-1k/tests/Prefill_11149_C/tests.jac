import from main { is_divisible_by_all }

test "case 0" {
    want = True;
    got = is_divisible_by_all(12, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_divisible_by_all(12, [1, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_divisible_by_all(12, [1, 2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_divisible_by_all(12, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_divisible_by_all(0, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_divisible_by_all(0, [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_divisible_by_all(1000000, [1, 2, 4, 5, 10, 20, 25]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
