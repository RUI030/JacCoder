import from main { extract_unique_words }

test "case 0" {
    want = ['the', 'cat', 'sat', 'on', 'mat'];
    got = extract_unique_words('the cat sat on the mat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['the', 'cat', 'sat', 'on', 'mat'];
    got = extract_unique_words('The Cat Sat On the Mat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = extract_unique_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['apple', 'banana', 'cherry', 'date'];
    got = extract_unique_words('apple banana cherry date');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['apple', 'banana', 'cherry', 'date'];
    got = extract_unique_words('apple apple banana cherry banana date date');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['hello,', 'world!', 'hello', 'world.'];
    got = extract_unique_words('Hello, world! Hello world.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
