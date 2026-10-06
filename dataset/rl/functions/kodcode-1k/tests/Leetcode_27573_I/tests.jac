import from main { calculate_expression }

test "case 0" {
    want = 8;
    got = calculate_expression('3+5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 8;
    got = calculate_expression('10-2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = calculate_expression('2+3-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = calculate_expression('10-3+2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = calculate_expression('1+2+3+4');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = calculate_expression('10-3-2-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = calculate_expression('5-3+2-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 7;
    got = calculate_expression('7');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = calculate_expression('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3;
    got = calculate_expression('3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 2500;
    got = calculate_expression('1000+2000-500');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 31744;
    got = calculate_expression('32768+1024-2048');
    assert got == want, f"expected={want!r} actual={got!r}";
}
