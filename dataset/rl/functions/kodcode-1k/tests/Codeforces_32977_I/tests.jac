import from main { max_flowers_planted }

test "case 0" {
    want = 50;
    got = max_flowers_planted(5, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 21;
    got = max_flowers_planted(3, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1000000;
    got = max_flowers_planted(1, 1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 100000;
    got = max_flowers_planted(100000, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_flowers_planted(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 100000000000;
    got = max_flowers_planted(100000, 1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
