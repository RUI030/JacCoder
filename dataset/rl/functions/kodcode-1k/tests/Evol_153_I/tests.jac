import from main { evaluate_expression }

test "case 0" {
    want = 5;
    got = evaluate_expression('3 + 4 - 2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = evaluate_expression('10 + 2 - 6');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 75;
    got = evaluate_expression('100 - 50 + 25');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 8;
    got = evaluate_expression('  3    +   7   - 2  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = evaluate_expression('  10+  20    -30 ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 123;
    got = evaluate_expression('123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 15;
    got = evaluate_expression('   20 + 5 - 10   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -10;
    got = evaluate_expression('10 - 20');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 150;
    got = evaluate_expression('100 + 200 - 150');
    assert got == want, f"expected={want!r} actual={got!r}";
}
