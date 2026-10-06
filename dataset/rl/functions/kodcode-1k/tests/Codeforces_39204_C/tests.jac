import from main { final_balance }

test "case 0" {
    want = 1000;
    got = final_balance(1000, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1500;
    got = final_balance(1000, [('deposit', 200), ('deposit', 300)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 500;
    got = final_balance(1000, [('withdrawal', 200), ('withdrawal', 300)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 800;
    got = final_balance(1000, [('withdrawal', 1200), ('withdrawal', 200)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 400;
    got = final_balance(1000, [('deposit', 500), ('withdrawal', 1200), ('withdrawal', 200), ('deposit', 300)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 300;
    got = final_balance(300, [('withdrawal', 500), ('withdrawal', 400)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 50;
    got = final_balance(0, [('deposit', 100), ('withdrawal', 50)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 100;
    got = final_balance(0, [('withdrawal', 50), ('deposit', 100)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = final_balance(100, [('withdrawal', 100)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
