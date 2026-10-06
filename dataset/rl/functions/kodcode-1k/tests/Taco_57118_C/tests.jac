import from main { process_scores }

test "case 0" {
    want = (100, 20, 57);
    got = process_scores('23 67 89 45 32 55 90 100 54 20');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (50, 50, 50);
    got = process_scores('50 50 50 50');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (100, 0, 50);
    got = process_scores('0 100 100 0 50');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (1, 1, 1);
    got = process_scores('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (99, 99, 99);
    got = process_scores('99 99 99 99');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (80, 60, 70);
    got = process_scores('60 70 80');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (0, 0, 0);
    got = process_scores('0 0 0 0 0 0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = (100, 100, 100);
    got = process_scores('100 100 100 100');
    assert got == want, f"expected={want!r} actual={got!r}";
}
