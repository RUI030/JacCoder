import from main { predict_out_of_stock_day }

test "case 0" {
    want = 4;
    got = predict_out_of_stock_day([2, 3, 1, 5, 6], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = predict_out_of_stock_day([1, 2, 3], 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = predict_out_of_stock_day([5, 5, 5, 5], 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = predict_out_of_stock_day([10], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = predict_out_of_stock_day([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = predict_out_of_stock_day([3, 3, 3], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = predict_out_of_stock_day([3, 3, 3], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = predict_out_of_stock_day([1, 1, 1, 1, 1], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = predict_out_of_stock_day([2, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = predict_out_of_stock_day([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = predict_out_of_stock_day([1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = -1;
    got = predict_out_of_stock_day([100], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 1;
    got = predict_out_of_stock_day([100], 99);
    assert got == want, f"expected={want!r} actual={got!r}";
}
