import from main { rearrange_possible }

test "case 0" {
    want = 'Yes\n1 10 2 7 4';
    got = rearrange_possible(5, 3, [1, 4, 7, 2, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'No';
    got = rearrange_possible(3, 6, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Yes\n1 10 3 8';
    got = rearrange_possible(4, 5, [10, 1, 8, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Yes\n1 2';
    got = rearrange_possible(2, 1, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'No';
    got = rearrange_possible(2, 2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Yes\n3 5';
    got = rearrange_possible(2, 1, [3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Yes\n1 5';
    got = rearrange_possible(2, 3, [1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Yes\n1 201 101';
    got = rearrange_possible(3, 100, [1, 101, 201]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'No';
    got = rearrange_possible(3, 100, [1, 50, 101]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'No';
    got = rearrange_possible(5, 2, [1, 1, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'Yes\n1 1000000000 2 4 3';
    got = rearrange_possible(5, 1, [1, 2, 3, 4, 1000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
