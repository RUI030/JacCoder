import from main { running_average }

test "case 0" {
    want = [1.0, 1.5, 2.0, 3.0, 4.0];
    got = running_average([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [10.0, 15.0, 25.0, 35.0, 45.0];
    got = running_average([10, 20, 30, 40, 50], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4.0, 5.0, 6.0, 7.0, 8.0];
    got = running_average([4, 5, 6, 7, 8], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = running_average([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10.0];
    got = running_average([10], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [10.0, 15.0, 20.0, 25.0, 30.0];
    got = running_average([10, 20, 30, 40, 50], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1.0, 1.5];
    got = running_average([1, 2], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1.0, 1.5, 2.5, 3.5, 4.5, 5.5];
    got = running_average([1, 2, 3, 4, 5, 6], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [3.0, 4.0, 5.0, 6.0, 8.0];
    got = running_average([3, 5, 7, 9, 11], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [1, 1.5, 2.0, 2.5, 3.0];
    got = running_average([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
