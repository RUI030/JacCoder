import from main { sort_by_score }

test "case 0" {
    want = ['Bob', 'Charlie', 'Alice', 'Dave'];
    got = sort_by_score([('Alice', 92), ('Bob', 95), ('Charlie', 95), ('Dave', 88)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['Alice', 'Bob', 'Charlie'];
    got = sort_by_score([('Alice', 100), ('Bob', 100), ('Charlie', 90)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['Jane', 'Smith', 'Doe', 'John'];
    got = sort_by_score([('John', 85), ('Jane', 90), ('Doe', 85), ('Smith', 90)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = sort_by_score([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['Single'];
    got = sort_by_score([('Single', 50)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['Alpha', 'Beta', 'Charlie'];
    got = sort_by_score([('Alpha', 77), ('Beta', 77), ('Charlie', 77)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
