import from main { lexical_analyzer }

test "case 0" {
    want = [('identifier', 'x'), ('operator', '='), ('integer', '10')];
    got = lexical_analyzer('x = 10');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [('identifier', 'x'), ('operator', '='), ('integer', '10'), ('operator', '+'), ('integer', '20')];
    got = lexical_analyzer('x = 10 + 20');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [('keyword', 'if'), ('identifier', 'count'), ('operator', '>='), ('integer', '10'), ('operator', ':')];
    got = lexical_analyzer('if count >= 10:');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [('identifier', 'total'), ('operator', '='), ('float', '3.14'), ('operator', '*'), ('identifier', 'radius'), ('operator', '**'), ('integer', '2')];
    got = lexical_analyzer('total = 3.14 * radius ** 2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [('identifier', 'flag'), ('operator', '='), ('keyword', 'True'), ('keyword', 'and'), ('identifier', 'value'), ('operator', '!='), ('keyword', 'False')];
    got = lexical_analyzer('flag = True and value != False');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [('identifier', 'variable_name'), ('operator', '='), ('integer', '7')];
    got = lexical_analyzer('variable_name = 7');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [('identifier', 'x'), ('operator', '<='), ('integer', '10'), ('keyword', 'and'), ('identifier', 'y'), ('operator', '>='), ('integer', '5')];
    got = lexical_analyzer('x <= 10 and y >= 5');
    assert got == want, f"expected={want!r} actual={got!r}";
}
