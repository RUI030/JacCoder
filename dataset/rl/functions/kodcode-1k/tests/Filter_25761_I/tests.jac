import from main { cube_elements }

test "case 0" {
    want = [1, 8, 27];
    got = cube_elements([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [-1, -8, -27];
    got = cube_elements([-1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1, 8];
    got = cube_elements([0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [-1, 0, 1];
    got = cube_elements([-1, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1000, 8000, 27000];
    got = cube_elements([10, 20, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
