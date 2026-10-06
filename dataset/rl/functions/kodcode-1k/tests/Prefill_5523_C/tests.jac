import from main { are_addresses_distinct }

test "case 0" {
    want = True;
    got = are_addresses_distinct(['123 Main St', '456 Elm St', '789 Oak St']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = are_addresses_distinct(['123 Main St', '456 Elm St', '123 Main St']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = are_addresses_distinct([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = are_addresses_distinct(['123 Main St']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = are_addresses_distinct(['123 Main St', '123 Main St', '123 Main St']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
