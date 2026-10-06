import from main { top_student }

test "case 0" {
    want = ('Charlie', 278);
    got = top_student([('Alice', 85, 90, 88), ('Bob', 78, 82, 80), ('Charlie', 92, 95, 91)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ('Eva', 264);
    got = top_student([('Dave', 70, 75, 80), ('Eva', 85, 89, 90)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ('Frank', 300);
    got = top_student([('Frank', 100, 100, 100)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ('George', 195);
    got = top_student([('George', 60, 65, 70), ('Hannah', 60, 65, 70)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ('John', 243);
    got = top_student([('Ian', 50, 51, 52), ('John', 80, 81, 82), ('Kevin', 30, 40, 50)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ('Martha', 150);
    got = top_student([('Linda', 45, 55, 45), ('Martha', 50, 50, 50)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ('Patricia', 270);
    got = top_student([('Nancy', 90, 85, 80), ('Oliver', 70, 60, 70), ('Patricia', 85, 90, 95)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = ('Quincy', 275);
    got = top_student([('Quincy', 95, 95, 85)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
