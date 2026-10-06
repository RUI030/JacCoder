import from main { find_undefeated_players }

test "case 0" {
    want = [0];
    got = find_undefeated_players([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 1, 2, 3];
    got = find_undefeated_players([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2];
    got = find_undefeated_players([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 2];
    got = find_undefeated_players([3, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4];
    got = find_undefeated_players([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0];
    got = find_undefeated_players([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
