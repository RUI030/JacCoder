import from main { word_count }

test "case 0" {
    want = {'hello': 1};
    got = word_count('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'hello': 3};
    got = word_count('Hello hello HELLO');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'hello': 3, 'world': 2, 'this': 1, 'is': 1, 'a': 1, 'test': 1};
    got = word_count('Hello world, hello! This is a test. Hello, world...');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'hi': 1, 'this': 1, 'test': 1, 'yes': 1, 'it': 1, 's': 1, 'okay': 1};
    got = word_count("Hi! This-test? Yes, it's... okay.");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'apple': 3};
    got = word_count('Apple apple APPLE');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {};
    got = word_count('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
