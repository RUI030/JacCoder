import from main { min_merge_cost }

test "case 0" {
    want = 0;
    got = min_merge_cost([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = min_merge_cost([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 29;
    got = min_merge_cost([4, 3, 2, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 8;
    got = min_merge_cost([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 8000;
    got = min_merge_cost([1000, 1000, 1000, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 190;
    got = min_merge_cost([10, 20, 30, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_merge_cost([10000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 10000;
    got = min_merge_cost([5000, 5000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = min_merge_cost([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
