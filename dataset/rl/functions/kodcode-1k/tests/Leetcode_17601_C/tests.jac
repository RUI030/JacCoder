import from main { can_convert_by_rearranging }

test "case 0" {
    want = True;
    got = can_convert_by_rearranging('abc', 'bca');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = can_convert_by_rearranging('abc', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = can_convert_by_rearranging('aabbcc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_convert_by_rearranging('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = can_convert_by_rearranging('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_convert_by_rearranging('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = can_convert_by_rearranging('abc', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = can_convert_by_rearranging('', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = can_convert_by_rearranging('a!b@c#', '#c@b!a');
    assert got == want, f"expected={want!r} actual={got!r}";
}
