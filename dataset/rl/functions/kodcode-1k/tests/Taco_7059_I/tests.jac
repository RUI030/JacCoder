import from main { longestContiguousOnes }

test "case 0" {
    want = 5;
    got = longestContiguousOnes('110011111011');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longestContiguousOnes('0000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = longestContiguousOnes('111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longestContiguousOnes('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longestContiguousOnes('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longestContiguousOnes('101010101010');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = longestContiguousOnes('000111110');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = longestContiguousOnes('11111000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = longestContiguousOnes('1010101');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = longestContiguousOnes('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
