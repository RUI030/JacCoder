import from main { winner_of_game }

test "case 0" {
    want = 'Bob';
    got = winner_of_game('abcdefg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Bob';
    got = winner_of_game('xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Alice';
    got = winner_of_game('abac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Alice';
    got = winner_of_game('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Alice';
    got = winner_of_game('xxxyyzz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Bob';
    got = winner_of_game('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Alice';
    got = winner_of_game('abbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Alice';
    got = winner_of_game('xyyzyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Bob';
    got = winner_of_game('abcdefgh');
    assert got == want, f"expected={want!r} actual={got!r}";
}
