import from main { assemble_bicycles }

test "case 0" {
    want = (5, 0, 0);
    got = assemble_bicycles(5, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (3, 0, 0);
    got = assemble_bicycles(3, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (4, 1, 0);
    got = assemble_bicycles(5, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (5, 3, 0);
    got = assemble_bicycles(8, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (3, 0, 1);
    got = assemble_bicycles(3, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (4, 0, 1);
    got = assemble_bicycles(4, 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (2, 1, 1);
    got = assemble_bicycles(3, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = (3, 1, 1);
    got = assemble_bicycles(4, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = (0, 0, 10);
    got = assemble_bicycles(0, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = (0, 5, 0);
    got = assemble_bicycles(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = (0, 0, 0);
    got = assemble_bicycles(0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = (100000, 0, 0);
    got = assemble_bicycles(100000, 200000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = (75000, 25000, 0);
    got = assemble_bicycles(100000, 150000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = (50000, 0, 0);
    got = assemble_bicycles(50000, 100000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = (45000, 5000, 0);
    got = assemble_bicycles(50000, 90000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
