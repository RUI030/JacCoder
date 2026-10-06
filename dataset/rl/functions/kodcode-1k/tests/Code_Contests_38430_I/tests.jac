import from main { generate_hashtags }

test "case 0" {
    want = '#first #is #my #photo #this';
    got = generate_hashtags('This is my first photo!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '#at #beach #beautiful #morning #sunrise #the';
    got = generate_hashtags('Sunrise at the beach. #beautiful #morning');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = generate_hashtags('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '#hello #testing #world';
    got = generate_hashtags('Hello2World! Testing 1, 2, 3.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '#caption #case #is #mixed #this';
    got = generate_hashtags('tHiS cApTiOn Is MiXeD CASE.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '#birthday #everyone #happy';
    got = generate_hashtags('Happy #Birthday @everyone!');
    assert got == want, f"expected={want!r} actual={got!r}";
}
