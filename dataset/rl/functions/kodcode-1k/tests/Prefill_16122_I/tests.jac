import from main { remove_non_letters }

test "case 0" {
    want = 'HelloWorld';
    got = remove_non_letters('Hello, World!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Python';
    got = remove_non_letters('Python3.8');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = remove_non_letters('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Thisisgreat';
    got = remove_non_letters('This is great! #2023');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'abcXYZ';
    got = remove_non_letters('abcXYZ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = remove_non_letters('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'ABCDEFG';
    got = remove_non_letters('ABCDEFG');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'xyz';
    got = remove_non_letters('xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'AmanaplanacanalPanama';
    got = remove_non_letters('A man, a plan, a canal, Panama!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'Nolemonnomelon';
    got = remove_non_letters('No lemon, no melon');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'WowPythoniscool';
    got = remove_non_letters('Wow! @ Python is cool.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
