import from main { number_of_partitions }

test "case 0" {
    want = 1;
    got = number_of_partitions(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = number_of_partitions(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = number_of_partitions(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = number_of_partitions(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = number_of_partitions(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 11;
    got = number_of_partitions(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 15;
    got = number_of_partitions(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 42;
    got = number_of_partitions(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 176;
    got = number_of_partitions(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 627;
    got = number_of_partitions(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 24061467864032622473692149727991;
    got = number_of_partitions(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = number_of_partitions(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
