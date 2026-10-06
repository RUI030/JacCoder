import from main { minimum_training_hours_per_day }

test "case 0" {
    want = 9;
    got = minimum_training_hours_per_day(5, 10, 15, 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = minimum_training_hours_per_day(5, 0, 0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = minimum_training_hours_per_day(5, 5, 5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 30;
    got = minimum_training_hours_per_day(1, 12, 10, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 30;
    got = minimum_training_hours_per_day(1000, 10000, 10000, 10000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = minimum_training_hours_per_day(1000, 1000, 1000, 1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
