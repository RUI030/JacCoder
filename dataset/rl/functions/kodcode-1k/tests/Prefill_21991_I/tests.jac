import from main { greet_developer }

test "case 0" {
    want = 'Hello, Alice';
    got = greet_developer('Alice');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Hello, ';
    got = greet_developer('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Hello, Dev@123';
    got = greet_developer('Dev@123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Hello,    ';
    got = greet_developer('   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Hello, 12345';
    got = greet_developer('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}
