import from main { diamond }

test "case 0" {
    want = '*';
    got = diamond(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ' * \n***\n * ';
    got = diamond(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '  *  \n *** \n*****\n *** \n  *  ';
    got = diamond(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '   *   \n  ***  \n ***** \n*******\n ***** \n  ***  \n   *   ';
    got = diamond(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '    *    \n   ***   \n  *****  \n ******* \n*********\n ******* \n  *****  \n   ***   \n    *    ';
    got = diamond(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = diamond(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = diamond(-3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = diamond(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
