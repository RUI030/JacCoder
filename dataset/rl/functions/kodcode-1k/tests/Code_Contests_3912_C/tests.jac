import from main { maximize_grid_sum }

test "case 0" {
    want = 18;
    got = maximize_grid_sum(3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = maximize_grid_sum(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 100000000;
    got = maximize_grid_sum(100, 10000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 500;
    got = maximize_grid_sum(10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 112;
    got = maximize_grid_sum(4, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 400;
    got = maximize_grid_sum(2, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
