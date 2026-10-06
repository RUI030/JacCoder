import from main { words_starting_with }

test "case 0" {
    want = ['Apple', 'Avocado', 'Apricot'];
    got = words_starting_with(['Apple', 'banana', 'Avocado', 'cherry', 'Apricot'], 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['Dog', 'Dolphin', 'duck'];
    got = words_starting_with(['Dog', 'cat', 'Dolphin', 'elephant', 'duck'], 'D');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['Cherry'];
    got = words_starting_with(['apple', 'Banana', 'avocado', 'Cherry', 'apricot'], 'C');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = words_starting_with(['apple', 'banana', 'cherry'], 'D');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['apple', 'apricot', 'avocado'];
    got = words_starting_with(['apple', 'apricot', 'avocado'], 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = words_starting_with([], 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}
