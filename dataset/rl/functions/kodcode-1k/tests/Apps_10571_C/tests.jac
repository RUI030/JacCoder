import from main { final_sequence_length }

test "case 0" {
    want = 9;
    got = final_sequence_length('a1B3', 'hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = final_sequence_length('x2Y4', 'world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = final_sequence_length('A1', 'B2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 8;
    got = final_sequence_length('C3D4', 'efgh');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 8;
    got = final_sequence_length('1234', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = final_sequence_length('9876', 'wxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 8;
    got = final_sequence_length('abcd', 'efgh');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 8;
    got = final_sequence_length('WXYZ', 'ijkl');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 10;
    got = final_sequence_length('a1b2C3', 'mnop');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 10;
    got = final_sequence_length('x7Y6z5', 'qrst');
    assert got == want, f"expected={want!r} actual={got!r}";
}
