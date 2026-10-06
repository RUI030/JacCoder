import from main { rearrange_string }

test "case 0" {
    want = 'abcabc';
    got = rearrange_string('aabbcc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'impossible';
    got = rearrange_string('aaab', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a';
    got = rearrange_string('a', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aabbcc';
    got = rearrange_string('aabbcc', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'impossible';
    got = rearrange_string('abcabc', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abababab';
    got = rearrange_string('aaaabbbb', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'abc';
    got = rearrange_string('abc', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abab';
    got = rearrange_string('aabb', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
