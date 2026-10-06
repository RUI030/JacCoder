import from main { cocktail_shaker_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = cocktail_shaker_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = cocktail_shaker_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-1, 0, 1, 2, 3, 4, 5];
    got = cocktail_shaker_sort([3, 0, 2, 5, -1, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = cocktail_shaker_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = cocktail_shaker_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 2, 2, 2, 2];
    got = cocktail_shaker_sort([2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000000, -500000000, 0, 500000000, 1000000000];
    got = cocktail_shaker_sort([1000000000, -1000000000, 0, 500000000, -500000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
