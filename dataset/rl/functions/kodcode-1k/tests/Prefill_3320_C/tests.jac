import from main { assemble_sentence }

test "case 0" {
    want = 'I like coding in Python.';
    got = assemble_sentence('I', 'like coding', 'in Python.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Hello world !';
    got = assemble_sentence('Hello', 'world', '!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ' This is a test .';
    got = assemble_sentence('', 'This is a test', '.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Once upon a time in a land far away.';
    got = assemble_sentence('Once upon a time', 'in a land far', 'away.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '*** Hello world!!!';
    got = assemble_sentence('***', 'Hello', 'world!!!');
    assert got == want, f"expected={want!r} actual={got!r}";
}
