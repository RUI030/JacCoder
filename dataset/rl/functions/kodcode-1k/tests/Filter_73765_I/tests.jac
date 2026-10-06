import from main { count_unique_words }

test "case 0" {
    want = 0;
    got = count_unique_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_unique_words('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = count_unique_words('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = count_unique_words('hello!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = count_unique_words('Hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = count_unique_words('Python is great, and Python is fun.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = count_unique_words('Hello hello HELLO');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = count_unique_words('Hello, world. hello.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 8;
    got = count_unique_words('A quick, brown Fox, jumped; over.... a! lazy! dog?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 8;
    got = count_unique_words('The year 2023 is here, and 2022 is gone.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
