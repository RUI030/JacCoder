import from main { process_votes }

test "case 0" {
    want = [[6]];
    got = process_votes(1, [[5]], [(1, 1, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[4]];
    got = process_votes(1, [[5]], [(1, 1, -1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[6, 7], [6, 2, 4], [2, 8]];
    got = process_votes(3, [[5, 7], [6, 2, 3], [1, 9]], [(1, 1, 1), (3, 2, -1), (2, 3, 1), (3, 1, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[5, 3], [7, 2]];
    got = process_votes(2, [[5, 3], [7, 2]], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[5, 3], [7, 3]];
    got = process_votes(2, [[5, 3], [7, 2]], [(1, 1, 1), (1, 1, -1), (2, 2, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [[6, 4], [6, 1]];
    got = process_votes(2, [[5, 3], [7, 2]], [(1, 1, 1), (1, 2, 1), (2, 1, -1), (2, 2, -1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
