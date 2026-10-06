import from main { optimized_cocktail_shaker_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = optimized_cocktail_shaker_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = optimized_cocktail_shaker_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-1, 0, 1, 2, 3, 4, 5];
    got = optimized_cocktail_shaker_sort([3, 0, 2, 5, -1, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = optimized_cocktail_shaker_sort([3, 5, 1, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = optimized_cocktail_shaker_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 2, 3, 4, 4, 5];
    got = optimized_cocktail_shaker_sort([4, 5, 3, 2, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000000, -1000000000, 0, 1000000000, 1000000000];
    got = optimized_cocktail_shaker_sort([-1000000000, 1000000000, 0, -1000000000, 1000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [7, 7, 7, 7, 7];
    got = optimized_cocktail_shaker_sort([7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
