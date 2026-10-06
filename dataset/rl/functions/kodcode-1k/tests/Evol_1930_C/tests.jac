import from main { max_additional_people }

test "case 0" {
    want = 3;
    got = max_additional_people(10, [2, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = max_additional_people(10, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = max_additional_people(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = max_additional_people(10, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = max_additional_people(10, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = max_additional_people(11, [1, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
