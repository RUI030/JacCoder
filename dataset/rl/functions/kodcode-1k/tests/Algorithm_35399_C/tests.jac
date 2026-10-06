import from main { compress_sequence }

test "case 0" {
    want = 'a3b2c2d4e1';
    got = compress_sequence('aaabbccdddde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a1b1c1';
    got = compress_sequence('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a1';
    got = compress_sequence('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'z5';
    got = compress_sequence('zzzzz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = compress_sequence('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a1b1c1d1e1f1g1h1i1j1k1l1m1n1o1p1q1r1s1t1u1v1w1x1y1z1';
    got = compress_sequence('abcdefghijklmnopqrstuvwxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a2b2c2d2e2f2g2h2';
    got = compress_sequence('aabbccddeeffgghh');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a2b2a2';
    got = compress_sequence('aabbaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
