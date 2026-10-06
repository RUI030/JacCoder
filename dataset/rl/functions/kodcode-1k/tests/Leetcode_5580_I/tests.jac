import from main { min_steps_to_unique_chars }

test "case 0" {
    want = 0;
    got = min_steps_to_unique_chars('abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = min_steps_to_unique_chars('aaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_steps_to_unique_chars('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_steps_to_unique_chars('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_steps_to_unique_chars('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = min_steps_to_unique_chars('abcabcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}
