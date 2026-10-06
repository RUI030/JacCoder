import from main { first_unique_char_optimized }

test "case 0" {
    want = 0;
    got = first_unique_char_optimized('leetcode');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = first_unique_char_optimized('loveleetcode');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = first_unique_char_optimized('aabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = first_unique_char_optimized('abcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = first_unique_char_optimized('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = first_unique_char_optimized('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = first_unique_char_optimized('abca');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = first_unique_char_optimized('abcdefghijklmnopqrstuvwxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = first_unique_char_optimized('aabcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 12;
    got = first_unique_char_optimized('aabbccddeeffg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = -1;
    got = first_unique_char_optimized('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = -1;
    got = first_unique_char_optimized('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
