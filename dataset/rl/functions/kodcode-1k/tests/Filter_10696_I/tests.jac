import from main { collapse_intervals }

test "case 0" {
    want = ['1->3', '5->6', '9->12'];
    got = collapse_intervals([1, 2, 3, 5, 6, 9, 10, 11, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['4'];
    got = collapse_intervals([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['2', '4', '6'];
    got = collapse_intervals([2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['3->7'];
    got = collapse_intervals([3, 4, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = collapse_intervals([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['3->4', '7->9'];
    got = collapse_intervals([3, 4, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['12->13', '15', '17->18', '20->21', '23'];
    got = collapse_intervals([12, 13, 15, 17, 18, 20, 21, 23]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
