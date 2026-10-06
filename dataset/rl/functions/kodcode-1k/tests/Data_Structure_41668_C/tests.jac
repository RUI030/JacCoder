import from main { reverse_sentence }

test "case 0" {
    want = 'pizza like I and kim keon am I';
    got = reverse_sentence('I am keon kim and I like pizza');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'World Hello';
    got = reverse_sentence('  Hello   World  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a';
    got = reverse_sentence('   a   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'code to learning am I';
    got = reverse_sentence('I  am   learning  to code');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverse_sentence('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverse_sentence('        ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Hello';
    got = reverse_sentence('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'WoRdS CaSe MiXeD';
    got = reverse_sentence('MiXeD CaSe WoRdS');
    assert got == want, f"expected={want!r} actual={got!r}";
}
