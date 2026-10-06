import from main { concatenated_sum }

test "case 0" {
    want = 123;
    got = concatenated_sum('1 2 3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 123456;
    got = concatenated_sum('12 34 56');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 987654;
    got = concatenated_sum('9 87 654');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 12;
    got = concatenated_sum('0 1 2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10200;
    got = concatenated_sum('10 20 0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 123456789;
    got = concatenated_sum('123 456 789');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 987654321;
    got = concatenated_sum('9876 543 21');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 12345;
    got = concatenated_sum('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = concatenated_sum('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}
