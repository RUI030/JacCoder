import from main { consecutiveCounts }

test "case 0" {
    want = [3, 2, 2];
    got = consecutiveCounts('aaabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 1, 1, 1];
    got = consecutiveCounts('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 3, 3, 3];
    got = consecutiveCounts('aabbbcccddd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = consecutiveCounts('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = consecutiveCounts('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2];
    got = consecutiveCounts('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 2, 2, 2];
    got = consecutiveCounts('aabbccdd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2, 2, 2, 2, 2];
    got = consecutiveCounts('aabbccaabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 1, 1, 1, 1, 1, 1, 1, 1];
    got = consecutiveCounts('abcabcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [10];
    got = consecutiveCounts('zzzzzzzzzz');
    assert got == want, f"expected={want!r} actual={got!r}";
}
