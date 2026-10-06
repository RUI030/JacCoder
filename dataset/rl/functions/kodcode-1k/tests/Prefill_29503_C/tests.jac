import from main { highest_value_from_string }

test "case 0" {
    want = 5;
    got = highest_value_from_string('1 2 3 4 5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = highest_value_from_string('-1 2 -3 4 5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = highest_value_from_string('-5 -4 -3 -2 -1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3.3;
    got = highest_value_from_string('1.1 2.2 3.3 -4.4 -5.5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 42;
    got = highest_value_from_string('42');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = highest_value_from_string('-1 3.5 2.7 0 8');
    assert got == want, f"expected={want!r} actual={got!r}";
}
