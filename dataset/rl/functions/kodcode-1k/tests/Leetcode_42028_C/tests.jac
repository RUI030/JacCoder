import from main { kth_lexicographical_string }

test "case 0" {
    want = 'aa';
    got = kth_lexicographical_string(2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'ab';
    got = kth_lexicographical_string(2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'ba';
    got = kth_lexicographical_string(2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'bb';
    got = kth_lexicographical_string(2, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = kth_lexicographical_string(2, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'aaa';
    got = kth_lexicographical_string(3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'bbb';
    got = kth_lexicographical_string(3, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = kth_lexicographical_string(3, 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'b';
    got = kth_lexicographical_string(1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '';
    got = kth_lexicographical_string(1, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '';
    got = kth_lexicographical_string(0, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'bbbb';
    got = kth_lexicographical_string(4, 16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = '';
    got = kth_lexicographical_string(4, 17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 'a';
    got = kth_lexicographical_string(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 'a';
    got = kth_lexicographical_string(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 'aaaaaaaaaa';
    got = kth_lexicographical_string(10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 'bbbbbbbbbb';
    got = kth_lexicographical_string(10, 1024);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = '';
    got = kth_lexicographical_string(10, 1025);
    assert got == want, f"expected={want!r} actual={got!r}";
}
