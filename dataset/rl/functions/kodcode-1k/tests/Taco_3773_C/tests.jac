import from main { normalize_grades }

test "case 0" {
    want = [];
    got = normalize_grades(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [('Alice', 100.0)];
    got = normalize_grades(1, [('Alice', 75)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [('Bob', 0.0)];
    got = normalize_grades(1, [('Bob', 0)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [('Alice', 75.0), ('Bob', 50.0), ('Charlie', 100.0), ('David', 80.0)];
    got = normalize_grades(4, [('Alice', 75), ('Bob', 50), ('Charlie', 100), ('David', 80)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [('Elena', 40.0), ('Lucas', 80.0), ('Marie', 100.0)];
    got = normalize_grades(3, [('Elena', 40), ('Lucas', 80), ('Marie', 100)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [('John', 100.0), ('Jane', 100.0), ('Doe', 100.0)];
    got = normalize_grades(3, [('John', 50), ('Jane', 50), ('Doe', 50)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [('Tom', 0.0), ('Jerry', 0.0), ('Spike', 0.0)];
    got = normalize_grades(3, [('Tom', 0), ('Jerry', 0), ('Spike', 0)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
