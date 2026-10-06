import from main { initialize_python_custom }

test "case 0" {
    want = 0;
    got = initialize_python_custom('/path/to/program', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = initialize_python_custom('/path/to/program', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = initialize_python_custom('/path/to/program', -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = initialize_python_custom('/path/to/program', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = initialize_python_custom(123, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = initialize_python_custom('', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = initialize_python_custom('/path/to/program', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
