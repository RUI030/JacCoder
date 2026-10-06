import from main { has_friend_never_receiving }

test "case 0" {
    want = 'NO';
    got = has_friend_never_receiving(5, [2, 3, 4, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = has_friend_never_receiving(4, [2, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = has_friend_never_receiving(2, [2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = has_friend_never_receiving(8, [2, 2, 3, 3, 4, 4, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = has_friend_never_receiving(6, [3, 4, 5, 6, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = has_friend_never_receiving(3, [2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = has_friend_never_receiving(7, [2, 3, 4, 5, 6, 7, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
