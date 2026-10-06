import from main { is_valid_shuffle }

test "case 0" {
    want = True;
    got = is_valid_shuffle('abc', 'def', 'adbcef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_valid_shuffle('abc', 'def', 'abdecf');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_valid_shuffle('abc', 'def', 'abcfed');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_valid_shuffle('123', '456', '142536');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_valid_shuffle('123', '456', '123465');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_valid_shuffle('a', 'b', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_valid_shuffle('a', 'b', 'ba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_valid_shuffle('a', 'b', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_valid_shuffle('a', 'b', 'bb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_valid_shuffle('', '', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_valid_shuffle('', 'a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_valid_shuffle('a', '', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = is_valid_shuffle('', 'a', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_valid_shuffle('a', '', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = True;
    got = is_valid_shuffle('abc', 'xyz', 'axybcz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = True;
    got = is_valid_shuffle('abc', 'xyz', 'abcxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = True;
    got = is_valid_shuffle('abc', 'xyz', 'axbycz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = True;
    got = is_valid_shuffle('abc', 'xyz', 'axbcyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = False;
    got = is_valid_shuffle('abc', 'xyz', 'axbyczz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 19" {
    want = False;
    got = is_valid_shuffle('abc', 'xyz', 'axbyczx');
    assert got == want, f"expected={want!r} actual={got!r}";
}
