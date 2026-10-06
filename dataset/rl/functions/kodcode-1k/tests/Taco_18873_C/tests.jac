import from main { min_retrieval_actions }

test "case 0" {
    want = 2;
    got = min_retrieval_actions(4, [3, 4, 2, 5], ['S', 'M', 'S', 'M']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = min_retrieval_actions(3, [5, 6, 3], ['L', 'L', 'L']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = min_retrieval_actions(5, [1, 2, 3, 4, 5], ['A', 'B', 'C', 'D', 'E']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = min_retrieval_actions(6, [5, 5, 5, 5, 5, 5], ['X', 'X', 'X', 'X', 'X', 'X']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_retrieval_actions(4, [10, 20, 10, 20], ['M', 'L', 'S', 'L']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_retrieval_actions(1, [10], ['S']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
