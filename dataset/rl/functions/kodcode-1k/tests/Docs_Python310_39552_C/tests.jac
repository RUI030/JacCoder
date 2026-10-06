import from main { check_compatibility }

test "case 0" {
    want = True;
    got = check_compatibility('windows', 'proactor', 'subprocess_exec');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = check_compatibility('windows', 'selector', 'subprocess_exec');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = check_compatibility('windows', 'default', 'subprocess_exec');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = check_compatibility('windows', 'proactor', 'create_unix_connection');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = check_compatibility('macos', 'selector', 'create_unix_server');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = check_compatibility('macos', 'proactor', 'subprocess_exec');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = check_compatibility('macos', 'default', 'add_reader');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = check_compatibility('linux', 'selector', 'add_writer');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = check_compatibility('linux', 'default', 'add_signal_handler');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = check_compatibility('linux', 'proactor', 'connect_read_pipe');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = check_compatibility('all', 'default', 'create_unix_connection');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = check_compatibility('all', 'default', 'subprocess_shell');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = check_compatibility('all', 'proactor', 'create_unix_server');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = check_compatibility('all', 'selector', 'subprocess_shell');
    assert got == want, f"expected={want!r} actual={got!r}";
}
