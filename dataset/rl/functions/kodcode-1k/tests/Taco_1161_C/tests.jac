import from main { max_magic_power }

test "case 0" {
    want = 75;
    got = max_magic_power(5, [('red', 5), ('blue', 10), ('red', 15), ('blue', 20), ('green', 25)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 10;
    got = max_magic_power(1, [('red', 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = max_magic_power(2, [('red', 5), ('red', 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 15;
    got = max_magic_power(3, [('red', 5), ('blue', 5), ('red', 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = max_magic_power(4, [('red', 1), ('blue', 2), ('green', 3), ('yellow', 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_magic_power(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 30;
    got = max_magic_power(2, [('red', 10), ('blue', 20)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 302;
    got = max_magic_power(5, [('red', 100), ('blue', 1), ('red', 100), ('blue', 1), ('red', 100)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
