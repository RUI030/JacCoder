import from main { process_string }

test "case 0" {
    want = '.t.r';
    got = process_string('t0u1r');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '.c.d.f.r.c.s';
    got = process_string('Codeforc3s2021');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '.b.c.b';
    got = process_string('aBAcAba7');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = process_string('aA0eE9');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '.h.l.l.w.r.l.d';
    got = process_string('HeLLoWoRLD123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '.b.c.d.f.g.h';
    got = process_string('bcdfgh');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '.b.c.d.f.g.h';
    got = process_string('BCDFGH');
    assert got == want, f"expected={want!r} actual={got!r}";
}
