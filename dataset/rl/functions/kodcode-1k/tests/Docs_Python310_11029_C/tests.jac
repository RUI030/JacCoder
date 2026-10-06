import from main { process_strings }

test "case 0" {
    want = ['2 + 2 = 4', '5 - 3*2 = -1', '(8 / 4) + 4 = 6.00', '7 * 3 + 1 = 22'];
    got = process_strings(['2 + 2', '5 - 3*2', '(8 / 4) + 4', '7 * 3 + 1']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['10 / 3 = 3.33', '5 / 2 + 3.5 = 6.00', '6 / 4 = 1.50'];
    got = process_strings(['10 / 3', '5 / 2 + 3.5', '6 / 4']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['4 * 5 = 20', '10 / 2 = 5.00', '7 * 3 - 1 = 20'];
    got = process_strings(['4 * 5', '10 / 2', '7 * 3 - 1']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['2 - 5 = -3', '8 / 2 = 4.00', '(4 * 3) / 6 = 2.00', '20 + 10 = 30'];
    got = process_strings(['2 - 5', '8 / 2', '(4 * 3) / 6', '20 + 10']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['(10 - 5) * 2 + 3 = 13', '(2 * 3) - 4 / 2 = 4.00', '((7 + 3) * 2) / 10 = 2.00'];
    got = process_strings(['(10 - 5) * 2 + 3', '(2 * 3) - 4 / 2', '((7 + 3) * 2) / 10']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
