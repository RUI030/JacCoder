import from main { eval_rpn }

test "single number" {
    want = 42;
    got = eval_rpn(["42"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "truncate toward zero" {
    want = -3;
    got = eval_rpn(["7", "-2", "/"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "negative literal" {
    want = -12;
    got = eval_rpn(["-3", "4", "*"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "subtraction order" {
    want = 6;
    got = eval_rpn(["10", "4", "-"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "longer" {
    want = 6;
    got = eval_rpn(["4", "13", "5", "/", "+"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "nested" {
    want = 22;
    got = eval_rpn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
