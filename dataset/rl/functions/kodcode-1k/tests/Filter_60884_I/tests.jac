import from main { extract_year }

test "case 0" {
    want = 2023;
    got = extract_year('2023-10-12');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2024;
    got = extract_year('2024-02-29');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2000;
    got = extract_year('2000-01-01');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1999;
    got = extract_year('1999-12-31');
    assert got == want, f"expected={want!r} actual={got!r}";
}
