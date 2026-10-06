import from main { to_snake_case }

test "case 0" {
    want = 'hello';
    got = to_snake_case('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'hello_world';
    got = to_snake_case('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'hello_world';
    got = to_snake_case('  hello world  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'hello_world';
    got = to_snake_case('hello   world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'hello_world';
    got = to_snake_case('Hello WoRLd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'hello_world';
    got = to_snake_case('Hello, World!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'hello_123_world';
    got = to_snake_case('Hello 123 World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = to_snake_case('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
