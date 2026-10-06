import from main { min_containers }

test "case 0" {
    want = 10;
    got = min_containers(10, 3, [6, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = min_containers(5, 4, [1, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = min_containers(5, 3, [2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 100;
    got = min_containers(100, 5, [20, 20, 20, 20, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = min_containers(10, 3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 15;
    got = min_containers(15, 4, [5, 5, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_containers(1, 1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = min_containers(5, 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = min_containers(5, 1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
