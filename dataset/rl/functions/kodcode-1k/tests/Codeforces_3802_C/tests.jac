import from main { longest_special_subsequence_length }

test "case 0" {
    want = 4;
    got = longest_special_subsequence_length('abacbd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = longest_special_subsequence_length('aaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 7;
    got = longest_special_subsequence_length('efghijk');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_special_subsequence_length('z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = longest_special_subsequence_length('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longest_special_subsequence_length('zyx');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 16;
    got = longest_special_subsequence_length('abacdefghcijklmnop');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_special_subsequence_length('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
