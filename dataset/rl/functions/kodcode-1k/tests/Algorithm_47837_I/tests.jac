import from main { reformat_sentence }

test "case 0" {
    want = 'Hello World! How Are You?';
    got = reformat_sentence('hello   world! how are you?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'This Is A Sample.';
    got = reformat_sentence('   This is a  sample.  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Hello';
    got = reformat_sentence('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Hello World';
    got = reformat_sentence('hELLo wORLD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Hello World';
    got = reformat_sentence('HELLO WORLD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Helloworld';
    got = reformat_sentence('helloworld');
    assert got == want, f"expected={want!r} actual={got!r}";
}
