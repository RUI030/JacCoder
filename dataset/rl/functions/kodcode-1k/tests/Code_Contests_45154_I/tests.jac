import from main { largest_even_number }

test "case 0" {
    want = 4312;
    got = largest_even_number(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = largest_even_number(3, [3, 5, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 85210;
    got = largest_even_number(5, [0, 1, 2, 5, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = largest_even_number(1, [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = largest_even_number(1, [7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4444;
    got = largest_even_number(4, [4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = largest_even_number(4, [3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 955312;
    got = largest_even_number(6, [9, 5, 3, 5, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 65100;
    got = largest_even_number(5, [0, 1, 6, 5, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
