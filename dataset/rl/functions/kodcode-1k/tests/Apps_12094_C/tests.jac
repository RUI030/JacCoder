import from main { generate_sequence }

test "case 0" {
    want = '';
    got = generate_sequence(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = generate_sequence(-5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '1';
    got = generate_sequence(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '1-2-3-4-5';
    got = generate_sequence(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '1-2-3-4-5-6-7-8-9-10';
    got = generate_sequence(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20';
    got = generate_sequence(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}
