import from main { instructor_feedback }

test "case 0" {
    want = 'Well-received';
    got = instructor_feedback(5, [8, 7, 6, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Well-received';
    got = instructor_feedback(10, [7, 8, 7, 7, 9, 6, 10, 7, 7, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Needs Improvement';
    got = instructor_feedback(5, [5, 6, 4, 6, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Needs Improvement';
    got = instructor_feedback(3, [3, 7, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Well-received';
    got = instructor_feedback(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Needs Improvement';
    got = instructor_feedback(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Needs Improvement';
    got = instructor_feedback(2, [2, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Well-received';
    got = instructor_feedback(2, [7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Needs Improvement';
    got = instructor_feedback(4, [4, 5, 6, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
