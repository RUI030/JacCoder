import from main { getRanges }

test "case 0" {
    want = ['0->2', '4->5', '7'];
    got = getRanges([0, 1, 2, 4, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['1->3', '6->8', '10'];
    got = getRanges([1, 2, 3, 6, 7, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['2', '4', '6', '8'];
    got = getRanges([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = getRanges([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['-1->2', '6', '8->9'];
    got = getRanges([-1, 0, 1, 2, 6, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['5'];
    got = getRanges([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['5->6'];
    got = getRanges([5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = ['5', '7'];
    got = getRanges([5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
