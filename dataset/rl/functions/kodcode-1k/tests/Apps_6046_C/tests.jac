import from main { garden_plots }

test "case 0" {
    want = (5, 6);
    got = garden_plots(10, 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (1, 91);
    got = garden_plots(7, 13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (0, 0);
    got = garden_plots(0, 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (0, 0);
    got = garden_plots(10, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (5, 6);
    got = garden_plots(10.5, 15.5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (1, 91);
    got = garden_plots(7.9, 13.1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (16, 1);
    got = garden_plots(16, 16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = (1, 1);
    got = garden_plots(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = (1, 1);
    got = garden_plots(1.5, 1.5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = (1, 187);
    got = garden_plots(11, 17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = (1, 247);
    got = garden_plots(13, 19);
    assert got == want, f"expected={want!r} actual={got!r}";
}
