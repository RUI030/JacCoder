import from main { can_assign_booths_unique }

test "case 0" {
    want = 'Possible';
    got = can_assign_booths_unique(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Possible';
    got = can_assign_booths_unique(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Impossible';
    got = can_assign_booths_unique(3, [1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Impossible';
    got = can_assign_booths_unique(5, [1, 2, 3, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Possible';
    got = can_assign_booths_unique(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Impossible';
    got = can_assign_booths_unique(4, [3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Possible';
    got = can_assign_booths_unique(4, [1000, 2000, 3000, 4000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Impossible';
    got = can_assign_booths_unique(4, [1000, 2000, 3000, 3000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
