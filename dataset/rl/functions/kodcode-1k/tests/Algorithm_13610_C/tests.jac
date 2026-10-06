import from main { sort_prices_descending }

test "case 0" {
    want = [99.99, 19.99, 15.5, 5.49, 0.99];
    got = sort_prices_descending([19.99, 5.49, 99.99, 0.99, 15.5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = sort_prices_descending([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [10.0, 10.0, 10.0];
    got = sort_prices_descending([10.0, 10.0, 10.0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5.99];
    got = sort_prices_descending([5.99]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10.0, 9.0, 8.0, 7.0, 6.0];
    got = sort_prices_descending([10.0, 9.0, 8.0, 7.0, 6.0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [19.99, 19.99, 5.49, 5.49, 0.99, 0.99];
    got = sort_prices_descending([5.49, 5.49, 19.99, 0.99, 0.99, 19.99]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1000000000000.0, 10000000000.0, 99.99, 15.5, 5.49, 0.99];
    got = sort_prices_descending([10000000000.0, 5.49, 99.99, 0.99, 1000000000000.0, 15.5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
