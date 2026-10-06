import from main { int_to_bool_representation }

test "case 0" {
    want = 'False';
    got = int_to_bool_representation(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'True';
    got = int_to_bool_representation(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'True';
    got = int_to_bool_representation(42);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'True';
    got = int_to_bool_representation(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'True';
    got = int_to_bool_representation(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'True';
    got = int_to_bool_representation(-42);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'True';
    got = int_to_bool_representation(-100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
