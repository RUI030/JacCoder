import from main { max_requests_processed }

test "case 0" {
    want = 5;
    got = max_requests_processed(3, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 10;
    got = max_requests_processed(1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_requests_processed(5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_requests_processed(1000, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 100;
    got = max_requests_processed(100, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1000;
    got = max_requests_processed(1000, 1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = max_requests_processed(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = max_requests_processed(4, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = max_requests_processed(10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 6;
    got = max_requests_processed(2, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = max_requests_processed(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 2;
    got = max_requests_processed(1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 1;
    got = max_requests_processed(1000, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 1000;
    got = max_requests_processed(1000, 1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 500;
    got = max_requests_processed(500, 500);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 500;
    got = max_requests_processed(1000, 500);
    assert got == want, f"expected={want!r} actual={got!r}";
}
