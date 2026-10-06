import from main { total_damage }

test "case 0" {
    want = 0;
    got = total_damage('sword', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = total_damage('axe', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = total_damage('bow', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 12.0;
    got = total_damage('sword', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 15.0;
    got = total_damage('sword', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 18.0;
    got = total_damage('sword', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 16.5;
    got = total_damage('axe', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 21.0;
    got = total_damage('axe', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 25.5;
    got = total_damage('axe', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 10.4;
    got = total_damage('bow', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 12.8;
    got = total_damage('bow', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 15.2;
    got = total_damage('bow', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = total_damage('dagger', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 0;
    got = total_damage('sword', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 0;
    got = total_damage('axe', -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 0;
    got = total_damage('bow', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
