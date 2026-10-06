import from main { manipulate_bytearrays }

test "case 0" {
    want = 'Hello';
    got = manipulate_bytearrays('Hello', 'World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Python';
    got = manipulate_bytearrays('Python', '310');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Data';
    got = manipulate_bytearrays('Data', 'Science');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Example';
    got = manipulate_bytearrays('Example', 'Ex');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'OnlyThis';
    got = manipulate_bytearrays('OnlyThis', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = manipulate_bytearrays('', 'Content');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'abcd';
    got = manipulate_bytearrays('abcd', '1234');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'short';
    got = manipulate_bytearrays('short', 'alongerone');
    assert got == want, f"expected={want!r} actual={got!r}";
}
