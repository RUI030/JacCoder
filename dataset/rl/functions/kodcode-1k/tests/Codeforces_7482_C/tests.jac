import from main { calculate_net_salaries }

test "case 0" {
    want = [36000, 48000, 84000, 56000, 45000];
    got = calculate_net_salaries([40000, 60000, 120000, 70000, 50000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [27000];
    got = calculate_net_salaries([30000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [64000];
    got = calculate_net_salaries([80000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [105000];
    got = calculate_net_salaries([150000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [40500, 44000, 73500];
    got = calculate_net_salaries([45000, 55000, 105000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = calculate_net_salaries([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [45000];
    got = calculate_net_salaries([50000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [80000];
    got = calculate_net_salaries([100000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
