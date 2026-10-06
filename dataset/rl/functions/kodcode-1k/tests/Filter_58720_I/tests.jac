import from main { multiply_elements }

test "case 0" {
    want = 24;
    got = multiply_elements([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = multiply_elements([1, 2, 0, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -24;
    got = multiply_elements([-1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 24;
    got = multiply_elements([-1, 2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = multiply_elements([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = multiply_elements([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
