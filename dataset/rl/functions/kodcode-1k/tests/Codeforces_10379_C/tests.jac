import from main { longest_zigzag_subsequence_length }

test "case 0" {
    want = 6;
    got = longest_zigzag_subsequence_length([1, 7, 4, 9, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = longest_zigzag_subsequence_length([1, 17, 5, 10, 13, 15, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_zigzag_subsequence_length([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_zigzag_subsequence_length([5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = longest_zigzag_subsequence_length([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = longest_zigzag_subsequence_length([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 7;
    got = longest_zigzag_subsequence_length([1, 3, 2, 4, 3, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
