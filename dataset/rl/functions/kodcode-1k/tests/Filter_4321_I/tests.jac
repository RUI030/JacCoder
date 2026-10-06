import from main { car_commands }

test "case 0" {
    want = ['Move Ahead', 'Turn Left', 'Turn Right'];
    got = car_commands(['AAA', 'BBB', 'CCC']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['Move Ahead', 'Unknown Command', 'Turn Right'];
    got = car_commands(['AAA', 'XYZ', 'CCC']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['Unknown Command', 'Unknown Command', 'Unknown Command'];
    got = car_commands(['XYZ', 'PQR', 'LMN']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = car_commands([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['Turn Right', 'Turn Right', 'Turn Right'];
    got = car_commands(['CCC', 'CCC', 'CCC']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
