import from main { cocktail_shaker_sort }

test "case 0" {
    want = [-1, 0, 3, 3, 7, 8];
    got = cocktail_shaker_sort([3, 0, -1, 8, 7, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = cocktail_shaker_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-40, -20, 20, 50, 100];
    got = cocktail_shaker_sort([100, 50, 20, -20, -40]);
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
    want = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    got = cocktail_shaker_sort([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    got = cocktail_shaker_sort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 1, 3, 3, 3, 5, 5, 8, 8];
    got = cocktail_shaker_sort([5, 3, 8, 3, 1, 5, 8, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-1000000000, -123456789, 0, 123456789, 1000000000];
    got = cocktail_shaker_sort([1000000000, -1000000000, 0, 123456789, -123456789]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [7, 7, 7, 7, 7];
    got = cocktail_shaker_sort([7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
