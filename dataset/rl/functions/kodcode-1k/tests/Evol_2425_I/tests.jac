import from main { sort_books_by_edition }

test "case 0" {
    want = [(1, 'Book A')];
    got = sort_books_by_edition([(1, 'Book A')]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 'Book A'), (2, 'Book B'), (3, 'Book C')];
    got = sort_books_by_edition([(1, 'Book A'), (2, 'Book B'), (3, 'Book C')]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(1, 'Book A'), (2, 'Book B'), (3, 'Book C')];
    got = sort_books_by_edition([(3, 'Book C'), (2, 'Book B'), (1, 'Book A')]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1, 'Book D'), (1, 'Book A'), (2, 'Book B'), (3, 'Book C')];
    got = sort_books_by_edition([(2, 'Book B'), (1, 'Book D'), (3, 'Book C'), (1, 'Book A')]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 'Book A'), (1, 'Book D'), (2, 'Book B'), (3, 'Book C')];
    got = sort_books_by_edition([(2, 'Book B'), (1, 'Book A'), (3, 'Book C'), (1, 'Book D')]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = sort_books_by_edition([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
