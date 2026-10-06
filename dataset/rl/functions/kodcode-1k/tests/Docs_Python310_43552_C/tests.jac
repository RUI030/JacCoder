import from main { process_string }

test "case 0" {
    want = 'apple banana grapefruit orange';
    got = process_string('apple banana Apple orange banana grapefruit banana Apple');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'hello';
    got = process_string('Hello hello HELLO');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'apple banana';
    got = process_string('banana apple Banana apple');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a brown dog fox jumps lazy over quick the';
    got = process_string('a quick BROWN fox jumps over the lazy dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = process_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abc';
    got = process_string('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'five four one three two';
    got = process_string('one one one two three four five');
    assert got == want, f"expected={want!r} actual={got!r}";
}
