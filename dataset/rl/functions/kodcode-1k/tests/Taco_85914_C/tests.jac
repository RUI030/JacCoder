import from main { parrot_repeats }

test "case 0" {
    want = 'Hello. Hello Hello';
    got = parrot_repeats('Hello.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'I love programming. programming programming';
    got = parrot_repeats('I love programming.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'The parrot is very talkative. talkative talkative';
    got = parrot_repeats('The parrot is very talkative.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'She sells seashells. seashells seashells';
    got = parrot_repeats('She sells seashells.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'I enjoy sunny days. days days';
    got = parrot_repeats('I enjoy sunny days.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Coding is fun. fun fun';
    got = parrot_repeats('Coding is fun.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'OpenAI creates amazing things. things things';
    got = parrot_repeats('OpenAI creates amazing things.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
