import from main { process_data }

test "case 0" {
    want = 'Sum: 579, Concatenated String: abcdef';
    got = process_data('123abc456def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Sum: 60, Concatenated String: hibyeyes';
    got = process_data('10hi20bye30yes');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Sum: 123, Concatenated String: abc';
    got = process_data('123abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Sum: 136, Concatenated String: abcdefghi';
    got = process_data('1a23bc45def67ghi');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Sum: 15, Concatenated String: abc';
    got = process_data('5a5b5c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Sum: 11100, Concatenated String: abcdef';
    got = process_data('100a1000bc10000def');
    assert got == want, f"expected={want!r} actual={got!r}";
}
