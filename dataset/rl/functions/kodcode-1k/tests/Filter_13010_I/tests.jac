import from main { sum_of_multiples }

test "case 0" {
    want = 23;
    got = sum_of_multiples(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 78;
    got = sum_of_multiples(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 233168;
    got = sum_of_multiples(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = sum_of_multiples(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 195;
    got = sum_of_multiples(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}
