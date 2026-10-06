import from main { isPossibleToBalance }

test "case 0" {
    want = True;
    got = isPossibleToBalance([1, 1, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = isPossibleToBalance([2, 1, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = isPossibleToBalance([10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = isPossibleToBalance([1, -1, 2, -2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = isPossibleToBalance([10000, 10000, -20000, 10000, 10000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = isPossibleToBalance([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = isPossibleToBalance([1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = isPossibleToBalance([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
