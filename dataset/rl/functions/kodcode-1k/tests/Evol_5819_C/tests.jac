import from main { evaluate_expression }

test "case 0" {
    want = 5;
    got = evaluate_expression('2 + 3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = evaluate_expression('5 - 2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12;
    got = evaluate_expression('3 * 4');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = evaluate_expression('8 / 2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 14;
    got = evaluate_expression('2 + 3 * 4');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 20;
    got = evaluate_expression('(2 + 3) * 4');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Error: Division by zero';
    got = evaluate_expression('4 / 0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Error: Invalid expression';
    got = evaluate_expression('2 + (3 * 4');
    assert got == want, f"expected={want!r} actual={got!r}";
}
