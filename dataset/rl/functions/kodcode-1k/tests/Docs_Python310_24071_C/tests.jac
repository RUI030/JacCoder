import from main { regex_matcher }

test "case 0" {
    want = True;
    got = regex_matcher('^[a-zA-Z0-9_]+$', 'Valid_123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = regex_matcher('^[a-zA-Z0-9_]+$', 'Invalid-123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = regex_matcher('^a.*b$', 'a123b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = regex_matcher('^a.*b$', 'a123c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = regex_matcher('^\\d{3}-\\d{2}-\\d{4}$', '123-45-6789');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = regex_matcher('^\\d{3}-\\d{2}-\\d{4}$', '12-345-6789');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = regex_matcher('^a$', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = regex_matcher('^a$', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = regex_matcher('^a*b$', 'aaaaab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = regex_matcher('^a*b$', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = regex_matcher('^a*b$', 'aaac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = regex_matcher('^[a-zA-Z]$', 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = regex_matcher('^[a-zA-Z]$', '1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = regex_matcher('^\\d+$', '12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = regex_matcher('^\\d+$', '123a45');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = True;
    got = regex_matcher('^\\w+$', 'abc123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = True;
    got = regex_matcher('^\\w+$', 'abc_123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = True;
    got = regex_matcher('^\\s*$', '   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = False;
    got = regex_matcher('^\\s*$', ' x ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 19" {
    want = True;
    got = regex_matcher('^[a-z]+\\d+$', 'abc123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 20" {
    want = False;
    got = regex_matcher('^[a-z]+\\d+$', '123abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}
