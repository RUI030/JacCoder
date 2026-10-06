import from main { total_blocks_to_add }

test "case 0" {
    want = 6;
    got = total_blocks_to_add(4, [1, 3, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = total_blocks_to_add(3, [5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = total_blocks_to_add(5, [2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = total_blocks_to_add(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = total_blocks_to_add(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 36;
    got = total_blocks_to_add(5, [1, 1, 1, 10, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 6;
    got = total_blocks_to_add(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = total_blocks_to_add(4, [4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
