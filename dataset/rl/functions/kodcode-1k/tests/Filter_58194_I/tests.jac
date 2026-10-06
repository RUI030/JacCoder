import from main { convert_to_percent }

test "case 0" {
    want = '50.00%';
    got = convert_to_percent(0.5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '100.00%';
    got = convert_to_percent(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '12.34%';
    got = convert_to_percent(0.1234);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '99.90%';
    got = convert_to_percent(0.999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '150.00%';
    got = convert_to_percent(150);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '200.50%';
    got = convert_to_percent(200.5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '7.25%';
    got = convert_to_percent(7.25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '1000.00%';
    got = convert_to_percent(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '0.00%';
    got = convert_to_percent(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '100.00%';
    got = convert_to_percent(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '1.01%';
    got = convert_to_percent(1.01);
    assert got == want, f"expected={want!r} actual={got!r}";
}
