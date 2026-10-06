import from main { swap_a_b }

test "case 0" {
    want = 'b';
    got = swap_a_b('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a';
    got = swap_a_b('b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'A';
    got = swap_a_b('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'B';
    got = swap_a_b('B');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'bacABc';
    got = swap_a_b('abcABc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'bbaa';
    got = swap_a_b('aabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'abba';
    got = swap_a_b('baab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = swap_a_b('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'xyzXYZ';
    got = swap_a_b('xyzXYZ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'bbaaccdefghijab';
    got = swap_a_b('aabbccdefghijba');
    assert got == want, f"expected={want!r} actual={got!r}";
}
