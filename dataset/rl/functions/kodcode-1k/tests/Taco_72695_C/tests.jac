import from main { minimum_additional_sessions }

test "case 0" {
    want = 2;
    got = minimum_additional_sessions(3, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = minimum_additional_sessions(5, 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = minimum_additional_sessions(4, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = minimum_additional_sessions(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = minimum_additional_sessions(1, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = minimum_additional_sessions(6, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = minimum_additional_sessions(6, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = minimum_additional_sessions(2, 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}
