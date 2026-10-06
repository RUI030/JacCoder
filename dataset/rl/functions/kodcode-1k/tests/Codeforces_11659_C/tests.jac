import from main { is_well_balanced }

test "case 0" {
    want = 'YES';
    got = is_well_balanced(6, 'ABCACB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = is_well_balanced(7, 'AABBACB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_well_balanced(1, 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = is_well_balanced(1, 'B');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = is_well_balanced(1, 'C');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = is_well_balanced(2, 'AA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = is_well_balanced(2, 'AB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = is_well_balanced(3, 'ABC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = is_well_balanced(3, 'AAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = is_well_balanced(6, 'ACBBCA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'YES';
    got = is_well_balanced(9, 'ABCABCABC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'NO';
    got = is_well_balanced(10, 'AAABBBCCCA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 'NO';
    got = is_well_balanced(9, 'AABBBCCCA');
    assert got == want, f"expected={want!r} actual={got!r}";
}
