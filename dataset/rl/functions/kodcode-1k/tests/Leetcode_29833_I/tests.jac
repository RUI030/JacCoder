import from main { rearrange_sentence }

test "case 0" {
    want = 'hello';
    got = rearrange_sentence('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'hi hello';
    got = rearrange_sentence('hello hi');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'hi be do';
    got = rearrange_sentence('hi be do');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a is this sentence';
    got = rearrange_sentence('this is a sentence');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'to be or to be not';
    got = rearrange_sentence('to be or not to be');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'I in love Python programming';
    got = rearrange_sentence('I love programming in Python');
    assert got == want, f"expected={want!r} actual={got!r}";
}
