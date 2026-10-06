import from main { longest_equal_char_segment }

test "case 0" {
    want = 6;
    got = longest_equal_char_segment('abbaaacc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_equal_char_segment('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = longest_equal_char_segment('ababab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = longest_equal_char_segment('abcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = longest_equal_char_segment('aabbccddeexx');
    assert got == want, f"expected={want!r} actual={got!r}";
}
