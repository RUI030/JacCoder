import from main { toCamelCase }

test "case 0" {
    want = 'helloWorld';
    got = toCamelCase('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'userName';
    got = toCamelCase('user-name');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'convertToCamelCase';
    got = toCamelCase('convert_to_camel_case');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'helloWorldTest';
    got = toCamelCase('hello-world_test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'test';
    got = toCamelCase('test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = toCamelCase('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = toCamelCase('-_-');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = toCamelCase('___');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'helloWorld';
    got = toCamelCase('-hello-world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'convertToCamelCase';
    got = toCamelCase('_convert_to_camel_case');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'helloWorld';
    got = toCamelCase('hello-world-');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'convertToCamelCase';
    got = toCamelCase('convert-to_camel_case_');
    assert got == want, f"expected={want!r} actual={got!r}";
}
