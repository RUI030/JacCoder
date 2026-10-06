import from main { evaluate_expression }

test "case 0" {
    want = 6;
    got = evaluate_expression('1+2+3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = evaluate_expression('5-3-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 14;
    got = evaluate_expression('10+5-3+2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = evaluate_expression('7');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = evaluate_expression('5+8-2+3-10+5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -3;
    got = evaluate_expression('0-5+2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1100;
    got = evaluate_expression('1000+200-150+50');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = evaluate_expression('0+0+0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = evaluate_expression('10-0-5');
    assert got == want, f"expected={want!r} actual={got!r}";
}
