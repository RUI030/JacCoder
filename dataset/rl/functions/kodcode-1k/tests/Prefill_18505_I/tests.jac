import from main { count_non_overlapping_occurrences }

test "case 0" {
    want = 0;
    got = count_non_overlapping_occurrences('hello world', 'test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_non_overlapping_occurrences('hello world', 'hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = count_non_overlapping_occurrences('banana', 'ana');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = count_non_overlapping_occurrences('aaaaaa', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = count_non_overlapping_occurrences('repeat repeat repeat', 'repeat');
    assert got == want, f"expected={want!r} actual={got!r}";
}
