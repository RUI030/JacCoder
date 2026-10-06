import from main { track_books }

test "case 0" {
    want = ['harrypotter 2\ntwilight 2\nthehobbit 1'];
    got = track_books(1, [(5, ['harrypotter', 'twilight', 'harrypotter', 'thehobbit', 'twilight'])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['harrypotter 2\ntwilight 2\nthehobbit 1', 'gameofthrones 2\nbecoming 1\ndune 1'];
    got = track_books(2, [(5, ['harrypotter', 'twilight', 'harrypotter', 'thehobbit', 'twilight']), (4, ['gameofthrones', 'becoming', 'gameofthrones', 'dune'])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['book1 1\nbook2 1\nbook3 1'];
    got = track_books(1, [(3, ['book1', 'book2', 'book3'])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['book1 3'];
    got = track_books(1, [(3, ['book1', 'book1', 'book1'])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['book1 1'];
    got = track_books(1, [(1, ['book1'])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
