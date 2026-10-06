import from main { calculate_exponential_sum }

test "case 0" {
    want = 1;
    got = calculate_exponential_sum(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = calculate_exponential_sum(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 32;
    got = calculate_exponential_sum(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3413;
    got = calculate_exponential_sum(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10405071317;
    got = calculate_exponential_sum(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = calculate_exponential_sum(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
