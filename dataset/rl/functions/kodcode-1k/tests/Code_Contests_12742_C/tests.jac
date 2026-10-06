import from main { longest_run_active_servers }

test "case 0" {
    want = 5;
    got = longest_run_active_servers(5, [1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_run_active_servers(5, [0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_run_active_servers(6, [1, 0, 1, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = longest_run_active_servers(7, [1, 1, 0, 1, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_run_active_servers(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_run_active_servers(1, [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = longest_run_active_servers(6, [1, 1, 0, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_run_active_servers(5, [0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = longest_run_active_servers(7, [1, 0, 1, 1, 0, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
