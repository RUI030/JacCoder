import from main { is_pangram }

test "case 0" {
    want = True;
    got = is_pangram('the quick brown fox jumps over a lazy dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_pangram('The quick brown fox jumps over a lazy dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_pangram('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_pangram('abcdefghij');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_pangram('a quick movement of the enemy will jeopardize five gunboats');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_pangram('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_pangram('    ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_pangram('abcdefghijklmnopqrstuvwxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_pangram('Pack my box with five dozen liquor jugs.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
