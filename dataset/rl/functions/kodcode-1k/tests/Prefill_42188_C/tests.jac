import from main { find_first_occurrence }

test "case 0" {
    want = 1;
    got = find_first_occurrence(['apple', 'banana', 'cherry'], 'banana');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = find_first_occurrence(['apple', 'banana', 'cherry'], 'apple');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = find_first_occurrence(['apple', 'banana', 'cherry'], 'cherry');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = find_first_occurrence(['apple', 'banana', 'cherry'], 'date');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = find_first_occurrence([], 'apple');
    assert got == want, f"expected={want!r} actual={got!r}";
}
