import from main { compress_ranges }

test "empty" {
    want = "";
    got = compress_ranges([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "single" {
    want = "4";
    got = compress_ranges([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "one run" {
    want = "0-3";
    got = compress_ranges([0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "negatives" {
    want = "-3--2,0,2-3";
    got = compress_ranges([-3, -2, 0, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "no runs" {
    want = "1,3,5";
    got = compress_ranges([1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
