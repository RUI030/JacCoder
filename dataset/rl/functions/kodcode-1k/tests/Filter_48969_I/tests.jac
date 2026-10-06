import from main { strings_to_length_dict }

test "case 0" {
    want = {'apple': 5, 'banana': 6, 'cherry': 6};
    got = strings_to_length_dict(['apple', 'banana', 'cherry']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'apple': 5, 'banana': 6, 'cherry': 6};
    got = strings_to_length_dict(['apple', 'banana', 'apple', 'cherry', 'banana']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'apple': 5};
    got = strings_to_length_dict(['apple', 'apple', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {};
    got = strings_to_length_dict([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'a': 1, 'ab': 2, 'abc': 3, '': 0};
    got = strings_to_length_dict(['a', 'ab', 'abc', '']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'Apple': 5, 'apple': 5};
    got = strings_to_length_dict(['Apple', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
