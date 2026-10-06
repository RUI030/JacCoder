import from main { longest_valid_word }

test "case 0" {
    want = 'abcde';
    got = longest_valid_word('abc zz abcde hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abcadef';
    got = longest_valid_word('abc abcadef abcase');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abcdefghij';
    got = longest_valid_word('hello world! abcdefghij! xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = longest_valid_word('k lmnopqrstuvw');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = longest_valid_word('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
