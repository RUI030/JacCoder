import from main { nth_term_of_sequence }

test "case 0" {
    want = 1;
    got = nth_term_of_sequence(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = nth_term_of_sequence(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = nth_term_of_sequence(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 27;
    got = nth_term_of_sequence(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 81;
    got = nth_term_of_sequence(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 243;
    got = nth_term_of_sequence(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 729;
    got = nth_term_of_sequence(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2187;
    got = nth_term_of_sequence(8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 6561;
    got = nth_term_of_sequence(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 19683;
    got = nth_term_of_sequence(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 59049;
    got = nth_term_of_sequence(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 177147;
    got = nth_term_of_sequence(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 531441;
    got = nth_term_of_sequence(13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 1594323;
    got = nth_term_of_sequence(14);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 4782969;
    got = nth_term_of_sequence(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 14348907;
    got = nth_term_of_sequence(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 43046721;
    got = nth_term_of_sequence(17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = 129140163;
    got = nth_term_of_sequence(18);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = 387420489;
    got = nth_term_of_sequence(19);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 19" {
    want = 1162261467;
    got = nth_term_of_sequence(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 20" {
    want = 1;
    got = nth_term_of_sequence(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 21" {
    want = 1162261467;
    got = nth_term_of_sequence(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}
