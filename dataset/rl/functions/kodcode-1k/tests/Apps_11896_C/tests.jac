import from main { conveyor_belt_sequence }

test "case 0" {
    want = True;
    got = conveyor_belt_sequence('abcde', 'cdeab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = conveyor_belt_sequence('xyz', 'zyx');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = conveyor_belt_sequence('abcdef', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = conveyor_belt_sequence('abcde', 'aabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = conveyor_belt_sequence('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = conveyor_belt_sequence('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = conveyor_belt_sequence('ab', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = conveyor_belt_sequence('ab', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = conveyor_belt_sequence('ab', 'ba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = conveyor_belt_sequence('ab', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = conveyor_belt_sequence('abcdefg', 'fg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = conveyor_belt_sequence('abcdefg', 'fa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = conveyor_belt_sequence('abcdefg', 'gf');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = conveyor_belt_sequence('abababab', 'abab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = True;
    got = conveyor_belt_sequence('abababab', 'baba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = conveyor_belt_sequence('abababab', 'aabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}
