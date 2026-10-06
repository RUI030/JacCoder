import from main { count_award_eligible_students }

test "case 0" {
    want = 0;
    got = count_award_eligible_students([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = count_award_eligible_students([160, 170]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = count_award_eligible_students([160, 160, 160]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = count_award_eligible_students([160, 180, 160]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = count_award_eligible_students([160, 180, 160, 170]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = count_award_eligible_students([160, 180, 160, 170, 160]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_award_eligible_students([150, 160, 170, 180, 190]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = count_award_eligible_students([190, 180, 170, 160, 150]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
