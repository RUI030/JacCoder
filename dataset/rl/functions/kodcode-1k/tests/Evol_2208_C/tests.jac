import from main { validate_hex_colors }

test "case 0" {
    want = [('#123', True), ('#abc', True)];
    got = validate_hex_colors(['#123', '#abc']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [('#112233', True), ('#A3E2F7', True)];
    got = validate_hex_colors(['#112233', '#A3E2F7']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [('123abc', False), ('123456', False)];
    got = validate_hex_colors(['123abc', '123456']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [('#12G', False), ('#12345Z', False)];
    got = validate_hex_colors(['#12G', '#12345Z']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [('', False)];
    got = validate_hex_colors(['']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [('#FFFFFF', True), ('abc123', False), ('#12G', False), ('#123', True), ('#fff', True)];
    got = validate_hex_colors(['#FFFFFF', 'abc123', '#12G', '#123', '#fff']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
