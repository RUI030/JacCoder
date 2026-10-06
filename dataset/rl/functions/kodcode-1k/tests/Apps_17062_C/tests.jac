import from main { bouncer_count }

test "case 0" {
    want = 0;
    got = bouncer_count([('Alex', 22), ('Bob', 25), ('Alice', 23)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = bouncer_count([('Alex', 20), ('Bob', 18), ('Alice', 19)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = bouncer_count([('Alex', 22), ('Bob', 22), ('Alice', 25), ('Alexander', 21), ('Alicia', 22)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = bouncer_count([('Alex', 22), ('Bob', 20), ('Alice', 25), ('Alexander', 21), ('Alicia', 19)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = bouncer_count([('Alex', 22), ('alexander', 25), ('bob', 23), ('alice', 24), ('Bob', 21)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = bouncer_count([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = bouncer_count([('Alex', 20)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = bouncer_count([('Alex', 22)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
