import from main { switch_case }

test "case 0" {
    want = 'hELLO wORLD! hAVE A great dAY.';
    got = switch_case('Hello World! Have a GREAT Day.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'pYTHON 3.8';
    got = switch_case('Python 3.8');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '123 abc XYZ';
    got = switch_case('123 ABC xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = switch_case('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '!@#$%^&*()';
    got = switch_case('!@#$%^&*()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'A';
    got = switch_case('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a';
    got = switch_case('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}
