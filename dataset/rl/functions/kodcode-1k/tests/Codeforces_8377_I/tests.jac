import from main { map_ids }

test "case 0" {
    want = [(101, 'a1b2'), (202, 'c3d4'), (303, 'e5f6')];
    got = map_ids(3, [101, 202, 303], ['a1b2', 'c3d4', 'e5f6']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 'abc'), (2, 'def')];
    got = map_ids(2, [1, 2], ['abc', 'def']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(123, 'id1'), (456, 'id2'), (789, 'id3'), (101, 'id4')];
    got = map_ids(4, [123, 456, 789, 101], ['id1', 'id2', 'id3', 'id4']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1000, 'x1y2z3')];
    got = map_ids(1, [1000], ['x1y2z3']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e')];
    got = map_ids(5, [1, 2, 3, 4, 5], ['a', 'b', 'c', 'd', 'e']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
