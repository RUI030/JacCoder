import from main { most_played_song }

test "case 0" {
    want = 'singlesong';
    got = most_played_song(1, [('singlesong', 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'songone';
    got = most_played_song(3, [('songone', 1), ('songtwo', 1), ('songthree', 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'songa';
    got = most_played_song(3, [('songa', 30), ('songb', 30), ('songc', 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'classical';
    got = most_played_song(4, [('rockstar', 1000), ('popstar', 1000), ('metallica', 999), ('classical', 1001)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'apple';
    got = most_played_song(3, [('banana', 50), ('apple', 50), ('cherry', 50)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'song2';
    got = most_played_song(2, [('song1', 10), ('song2', 20)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
