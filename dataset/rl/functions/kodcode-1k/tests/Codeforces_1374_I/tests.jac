import from main { count_unique_triplets }

test "case 0" {
    want = 2;
    got = count_unique_triplets(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = count_unique_triplets(4, [1, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = count_unique_triplets(4, [1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = count_unique_triplets(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = count_unique_triplets(5, [1, 2, 3, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = count_unique_triplets(5, [100000, 50000, 50000, 100, 100000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = count_unique_triplets(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
