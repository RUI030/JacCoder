import from main { advanced_reverse }

test "case 0" {
    want = 'olleh';
    got = advanced_reverse('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'racecar';
    got = advanced_reverse('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = advanced_reverse('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '!amanaP ,lanac a ,nalp a ,nam A';
    got = advanced_reverse('A man, a plan, a canal, Panama!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '54321';
    got = advanced_reverse('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '!dlr0W 0ll3H';
    got = advanced_reverse('H3ll0 W0rld!');
    assert got == want, f"expected={want!r} actual={got!r}";
}
