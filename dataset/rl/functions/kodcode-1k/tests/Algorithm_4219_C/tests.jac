import from main { generate_acronym }

test "case 0" {
    want = 'RAM';
    got = generate_acronym('Random Access Memory');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'ASAP';
    got = generate_acronym('as soon as possible');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YOLO';
    got = generate_acronym('you only live once');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'H';
    got = generate_acronym('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = generate_acronym('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'HWE';
    got = generate_acronym('Hello World example');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'SOW';
    got = generate_acronym('  spaced   out   words  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'ABCD';
    got = generate_acronym('a b c d');
    assert got == want, f"expected={want!r} actual={got!r}";
}
