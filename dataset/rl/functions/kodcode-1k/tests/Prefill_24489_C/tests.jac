import from main { filter_strings_starting_with }

test "case 0" {
    want = [];
    got = filter_strings_starting_with([], 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = filter_strings_starting_with(['apple', 'banana', 'cherry'], 'd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['apple', 'apricot'];
    got = filter_strings_starting_with(['apple', 'apricot'], 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['apple', 'avocado'];
    got = filter_strings_starting_with(['apple', 'banana', 'avocado'], 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['apricot'];
    got = filter_strings_starting_with(['Apple', 'apricot', 'Avocado'], 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['Apple', 'Avocado'];
    got = filter_strings_starting_with(['Apple', 'apricot', 'Avocado'], 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['#hashtag', '#trend'];
    got = filter_strings_starting_with(['#hashtag', '@mention', '#trend'], '#');
    assert got == want, f"expected={want!r} actual={got!r}";
}
