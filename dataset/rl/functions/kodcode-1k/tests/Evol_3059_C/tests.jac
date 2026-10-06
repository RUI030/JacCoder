import from main { evaluate_expressions }

test "case 0" {
    want = [5, -1, 42, 2.0, 'ERROR', 'ERROR', 'ERROR'];
    got = evaluate_expressions(['2+3', '4-5', '6*7', '8/4', '10/0', '2**3', '5 +']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5.0, 21, -2, 4];
    got = evaluate_expressions(['20/4', '3*7', '5-7', '2 + 2']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [12, 17, 24, 5.0];
    got = evaluate_expressions([' 10 + 2', '  20  - 3', '6 *  4', '  15 / 3 ']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['ERROR', 'ERROR', 'ERROR', 'ERROR', 'ERROR', 'ERROR'];
    got = evaluate_expressions(['2 +', '10 - a', '4 *', '/ 2', '3 3 +', '']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['ERROR', 2.5];
    got = evaluate_expressions(['10 / 0', '5 / 2']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
