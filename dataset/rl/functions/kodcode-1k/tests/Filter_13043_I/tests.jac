import from main { is_string_in_list }

test "case 0" {
    want = True;
    got = is_string_in_list(['hello', 'world', 'python'], 'python');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_string_in_list(['hello', 'world', 'java'], 'python');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_string_in_list([], 'python');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_string_in_list(['', 'world', 'python'], 'hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_string_in_list(['python', 'world', 'python'], 'python');
    assert got == want, f"expected={want!r} actual={got!r}";
}
