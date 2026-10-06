import from main { evaluate_expression }

test "case 0" {
    want = 6;
    got = evaluate_expression('3+5-2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = evaluate_expression('10+20-30');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 30;
    got = evaluate_expression('40-15+5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = evaluate_expression('1+2+3-4');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = evaluate_expression('5-3+2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 250;
    got = evaluate_expression('100+200-50');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 700;
    got = evaluate_expression('1000-500+200');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 501;
    got = evaluate_expression('123+456-78');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = evaluate_expression('1+1+1+1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 100;
    got = evaluate_expression('10+20+30+40');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 3;
    got = evaluate_expression('10-5-2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 15;
    got = evaluate_expression('50-20-10-5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 5;
    got = evaluate_expression('1+2-3+4-5+6');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 12;
    got = evaluate_expression('10-1+2-3+4');
    assert got == want, f"expected={want!r} actual={got!r}";
}
