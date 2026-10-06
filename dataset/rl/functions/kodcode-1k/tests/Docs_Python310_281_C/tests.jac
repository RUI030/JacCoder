import from main { convert_and_check_boolean }

test "case 0" {
    want = (False, False);
    got = convert_and_check_boolean(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (True, False);
    got = convert_and_check_boolean(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (True, True);
    got = convert_and_check_boolean(True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (False, True);
    got = convert_and_check_boolean(False);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (True, False);
    got = convert_and_check_boolean(42);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (True, False);
    got = convert_and_check_boolean(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (True, False);
    got = convert_and_check_boolean(1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = (True, False);
    got = convert_and_check_boolean(-1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
