import from main { generate_sequence }

test "case 0" {
    want = [1];
    got = generate_sequence(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2];
    got = generate_sequence(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3, 2];
    got = generate_sequence(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 4, 2, 3];
    got = generate_sequence(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 5, 2, 4, 3];
    got = generate_sequence(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 10, 2, 9, 3, 8, 4, 7, 5, 6];
    got = generate_sequence(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
