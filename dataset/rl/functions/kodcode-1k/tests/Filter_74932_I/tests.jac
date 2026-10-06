import from main { generate_grocery_list }

test "case 0" {
    want = ['Apple: 4'];
    got = generate_grocery_list({'Apple': 4});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['Apple: 4', 'Banana: 6', 'Milk: 2'];
    got = generate_grocery_list({'Apple': 4, 'Banana': 6, 'Milk': 2});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = generate_grocery_list({});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['Apple: 0', 'Banana: 5'];
    got = generate_grocery_list({'Apple': 0, 'Banana': 5});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['Apple: 1000', 'Banana: 750'];
    got = generate_grocery_list({'Apple': 1000, 'Banana': 750});
    assert got == want, f"expected={want!r} actual={got!r}";
}
