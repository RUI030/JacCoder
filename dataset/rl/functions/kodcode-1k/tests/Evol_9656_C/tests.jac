import from main { remove_vowels }

test "case 0" {
    want = ['ppl', 'bnn', 'grp'];
    got = remove_vowels(['apple', 'banana', 'grape']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['lphnt', '', 'bnn'];
    got = remove_vowels(['elephant', 'oooooo', 'banana']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = remove_vowels([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['rhythm', 'crypt', 'gym'];
    got = remove_vowels(['rhythm', 'crypt', 'gym']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['', ''];
    got = remove_vowels(['aeiou', 'eau']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
