import from main { count_binary_substrings }

test "case 0" {
    want = 6;
    got = count_binary_substrings('00110011');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = count_binary_substrings('10101');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = count_binary_substrings('000111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = count_binary_substrings('000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = count_binary_substrings('111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = count_binary_substrings('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_binary_substrings('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = count_binary_substrings('00110');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = count_binary_substrings('00110');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 4;
    got = count_binary_substrings('0011100');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 6;
    got = count_binary_substrings('001100111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 3;
    got = count_binary_substrings('01100');
    assert got == want, f"expected={want!r} actual={got!r}";
}
