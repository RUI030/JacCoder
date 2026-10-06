import from main { grade_exam }

test "case 0" {
    want = 4;
    got = grade_exam(['A', 'B', 'C', 'D'], ['A', 'B', 'C', 'D']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = grade_exam(['A', 'B', 'C', 'D'], ['D', 'C', 'B', 'A']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = grade_exam(['A', 'B', 'C', 'D'], ['A', 'C', 'C', 'D']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = grade_exam([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = grade_exam(['A', 'C', 'B', 'D'], ['a', 'c', 'b', 'd']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = grade_exam(['A', 'B', 'C', 'D', 'A', 'B'], ['A', 'C', 'C', 'D', 'A', 'B']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
