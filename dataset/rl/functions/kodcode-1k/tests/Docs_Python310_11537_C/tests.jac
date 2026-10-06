import from main { describe_integer_with_text }

test "case 0" {
    want = '42 - Answer to the Ultimate Question';
    got = describe_integer_with_text(42, 'Answer to the Ultimate Question');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '-10 - Negative number';
    got = describe_integer_with_text(-10, 'Negative number');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '0 - Zero value';
    got = describe_integer_with_text(0, 'Zero value');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '5 - ';
    got = describe_integer_with_text(5, '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '123 - #$@! Special Characters';
    got = describe_integer_with_text(123, '#$@! Special Characters');
    assert got == want, f"expected={want!r} actual={got!r}";
}
