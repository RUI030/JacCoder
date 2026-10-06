import from main { longest_vowel_substring }

test "case 0" {
    want = 1;
    got = longest_vowel_substring('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = longest_vowel_substring('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = longest_vowel_substring('aeiou');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = longest_vowel_substring('aeiouuoea');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = longest_vowel_substring('abcdeeiouuxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_vowel_substring('bcdfghjklmnpqrstvwxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_vowel_substring('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = longest_vowel_substring('a1e!i2o#u');
    assert got == want, f"expected={want!r} actual={got!r}";
}
