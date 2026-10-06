import from main { look_and_say }

test "case 0" {
    want = '1';
    got = look_and_say(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '11';
    got = look_and_say(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '21';
    got = look_and_say(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '1211';
    got = look_and_say(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '111221';
    got = look_and_say(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '312211';
    got = look_and_say(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '13211311123113112211';
    got = look_and_say(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
