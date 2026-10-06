import from main { count_full_glasses }

test "case 0" {
    want = 6;
    got = count_full_glasses(2, 3, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 12;
    got = count_full_glasses(3, 4, 12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 25;
    got = count_full_glasses(5, 5, 25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = count_full_glasses(3, 4, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 15;
    got = count_full_glasses(5, 4, 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = count_full_glasses(2, 2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_full_glasses(2, 2, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = count_full_glasses(3, 3, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 7;
    got = count_full_glasses(4, 4, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = count_full_glasses(1, 1, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = count_full_glasses(1, 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = count_full_glasses(1, 1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
