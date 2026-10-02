import from main { rle_encode }

test "empty string" {
    want = "";
    got = rle_encode("");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "no repeats" {
    want = "1a1b1c";
    got = rle_encode("abc");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "long run" {
    want = "12z";
    got = rle_encode("zzzzzzzzzzzz");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "runs separated" {
    want = "2a1X2a";
    got = rle_encode("aaXaa");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "spaces count" {
    want = "2 1b";
    got = rle_encode("  b");
    assert got == want, f"expected={want!r} actual={got!r}";
}
