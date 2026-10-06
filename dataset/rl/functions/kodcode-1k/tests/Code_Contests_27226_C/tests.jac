import from main { max_full_flower_beds }

test "case 0" {
    want = 3;
    got = max_full_flower_beds(3, 3, [2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = max_full_flower_beds(4, 2, [2, 2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_full_flower_beds(5, 5, [1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = max_full_flower_beds(4, 2, [3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = max_full_flower_beds(3, 3, [0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 10;
    got = max_full_flower_beds(1, 10, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_full_flower_beds(1, 10, [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = max_full_flower_beds(3, 2, [100, 100, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 6;
    got = max_full_flower_beds(3, 100, [2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 10;
    got = max_full_flower_beds(7, 10, [1, 3, 0, 2, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
