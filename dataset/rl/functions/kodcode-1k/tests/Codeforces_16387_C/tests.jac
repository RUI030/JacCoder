import from main { canArrangeBalloons }

test "case 0" {
    want = 'YES';
    got = canArrangeBalloons(3, ['RGB', 'BRG', 'GBR']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = canArrangeBalloons(2, ['RGB', 'RGB']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = canArrangeBalloons(4, ['R', 'G', 'B', 'Y']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = canArrangeBalloons(3, ['RRR', 'GGG', 'BBB']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = canArrangeBalloons(3, ['RGB', 'RGB', 'RGB']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = canArrangeBalloons(3, ['RGB', 'GBR', 'BRG']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = canArrangeBalloons(2, ['AB', 'CD']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = canArrangeBalloons(3, ['ABC', 'DEF', 'GHI']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'YES';
    got = canArrangeBalloons(1, ['A']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
