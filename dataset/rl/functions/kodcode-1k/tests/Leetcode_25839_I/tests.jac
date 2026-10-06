import from main { round_grades }

test "case 0" {
    want = [33, 37];
    got = round_grades([33, 37]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [40, 40, 40, 45, 47, 50];
    got = round_grades([38, 39, 40, 45, 47, 49]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [62, 65, 65];
    got = round_grades([62, 63, 64]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [33, 40, 60, 82, 37, 90, 100];
    got = round_grades([33, 39, 60, 82, 37, 89, 99]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [75, 67, 40, 33];
    got = round_grades([73, 67, 38, 33]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
