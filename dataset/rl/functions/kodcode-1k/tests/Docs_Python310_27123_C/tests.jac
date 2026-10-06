import from main { process_data }

test "case 0" {
    want = 12;
    got = process_data([1, 2, None, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = process_data([None, None, None]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 15;
    got = process_data([None, 1, 2, 3, None, 4, 5, None]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = process_data([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = process_data([0, None, -3, 7, None, None, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 25;
    got = process_data([10, 20, None, 5, None, -10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 15;
    got = process_data([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
