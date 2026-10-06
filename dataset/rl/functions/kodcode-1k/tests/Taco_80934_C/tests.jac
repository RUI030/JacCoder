import from main { is_valid_traffic }

test "case 0" {
    want = 'VALID';
    got = is_valid_traffic(3, 2, [1, 0, 1], [(1, 2), (2, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'VALID';
    got = is_valid_traffic(5, 3, [0, 1, 0, 1, 0], [(1, 2), (2, 3), (4, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'INVALID';
    got = is_valid_traffic(4, 4, [1, 1, 0, 0], [(1, 2), (2, 3), (3, 4), (4, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'INVALID';
    got = is_valid_traffic(3, 3, [1, 1, 1], [(1, 2), (2, 3), (3, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'VALID';
    got = is_valid_traffic(2, 1, [0, 0], [(1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'INVALID';
    got = is_valid_traffic(2, 1, [1, 1], [(1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'VALID';
    got = is_valid_traffic(5, 0, [1, 0, 1, 0, 1], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}
