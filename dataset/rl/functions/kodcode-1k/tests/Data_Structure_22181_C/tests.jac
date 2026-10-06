import from main { cocktail_shaker_sort }

test "case 0" {
    want = [1, 2, 3];
    got = cocktail_shaker_sort([3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 1, 2, 4, 5, 8];
    got = cocktail_shaker_sort([5, 1, 4, 2, 8, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = cocktail_shaker_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = cocktail_shaker_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-3, -2, -1, 0, 1, 2];
    got = cocktail_shaker_sort([-3, -1, -2, 0, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-3, 0, 3, 3];
    got = cocktail_shaker_sort([3, -3, 0, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [10, 20, 30, 40, 50];
    got = cocktail_shaker_sort([10, 20, 30, 40, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [5, 5, 5, 5, 5];
    got = cocktail_shaker_sort([5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
