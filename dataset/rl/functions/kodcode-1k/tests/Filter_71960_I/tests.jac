import from main { concatenate_strings }

test "case 0" {
    want = 'apple,banana,cherry';
    got = concatenate_strings(['apple', 'banana', 'cherry']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'apple';
    got = concatenate_strings(['apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = concatenate_strings([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ',,';
    got = concatenate_strings(['', '', '']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'hello@,#world,$$';
    got = concatenate_strings(['hello@', '#world', '$$']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
