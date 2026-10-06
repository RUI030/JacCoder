import from main { time_to_infect_everyone }

test "case 0" {
    want = 4;
    got = time_to_infect_everyone(5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = time_to_infect_everyone(2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = time_to_infect_everyone(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9999;
    got = time_to_infect_everyone(10000, 5000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = time_to_infect_everyone(3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = time_to_infect_everyone(2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = time_to_infect_everyone(2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
