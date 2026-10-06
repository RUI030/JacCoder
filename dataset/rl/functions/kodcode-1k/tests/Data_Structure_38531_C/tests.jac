import from main { custom_reverse }

test "case 0" {
    want = 'olleh';
    got = custom_reverse('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'dlrow';
    got = custom_reverse('world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'amanaP ,lanac a ,nalp a ,nam A';
    got = custom_reverse('A man, a plan, a canal, Panama');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = custom_reverse('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 's';
    got = custom_reverse('s');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '#@!321';
    got = custom_reverse('123!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'racecar';
    got = custom_reverse('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '   cba   ';
    got = custom_reverse('   abc   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'nur sesrun';
    got = custom_reverse('nurses run');
    assert got == want, f"expected={want!r} actual={got!r}";
}
