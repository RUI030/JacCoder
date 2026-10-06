import from main { rearrange_string }

test "case 0" {
    want = '123abc';
    got = rearrange_string('b3a1c2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '123abc';
    got = rearrange_string('abc123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '12345';
    got = rearrange_string('54321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'xyz';
    got = rearrange_string('xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '6789abcz';
    got = rearrange_string('z9a8b7c6');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = rearrange_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '5';
    got = rearrange_string('5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a';
    got = rearrange_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '111';
    got = rearrange_string('111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'aaa';
    got = rearrange_string('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
