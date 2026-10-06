import from main { sum_of_fibonacci }

test "case 0" {
    want = 0;
    got = sum_of_fibonacci(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = sum_of_fibonacci(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = sum_of_fibonacci(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = sum_of_fibonacci(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = sum_of_fibonacci(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 12;
    got = sum_of_fibonacci(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 20;
    got = sum_of_fibonacci(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 143;
    got = sum_of_fibonacci(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 17710;
    got = sum_of_fibonacci(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 32951280098;
    got = sum_of_fibonacci(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}
