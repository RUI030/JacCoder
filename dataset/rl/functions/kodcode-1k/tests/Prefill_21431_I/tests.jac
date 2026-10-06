import from main { string_to_list }

test "case 0" {
    want = [];
    got = string_to_list('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['a'];
    got = string_to_list('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['h', 'e', 'l', 'l', 'o'];
    got = string_to_list('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'];
    got = string_to_list('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['h', 'i', '!'];
    got = string_to_list('hi!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['#', '$', '%', '&'];
    got = string_to_list('#$%&');
    assert got == want, f"expected={want!r} actual={got!r}";
}
