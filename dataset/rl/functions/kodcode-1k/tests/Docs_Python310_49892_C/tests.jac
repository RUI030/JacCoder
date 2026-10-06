import from main { custom_completer }

test "case 0" {
    want = 'my_module';
    got = custom_completer('my_mod', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = None;
    got = custom_completer('my_mod', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'function_a';
    got = custom_completer('my_module.f', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'function_b';
    got = custom_completer('my_module.f', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = custom_completer('my_module.f', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'ClassA';
    got = custom_completer('my_module.Cl', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'ClassB';
    got = custom_completer('my_module.Cl', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = None;
    got = custom_completer('my_module.Cl', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = None;
    got = custom_completer('unknown', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = None;
    got = custom_completer('my_module.unknown', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = None;
    got = custom_completer('.', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'function_a';
    got = custom_completer('my_module.', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
