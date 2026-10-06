import from main { check_book_availability }

test "case 0" {
    want = "The book '1984' is available.";
    got = check_book_availability(['The Great Gatsby', '1984', 'To Kill a Mockingbird'], '1984');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = "The book 'Great' is not available. Did you mean: The Great Gatsby?";
    got = check_book_availability(['The Great Gatsby', '1984', 'To Kill a Mockingbird'], 'Great');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = "The book 'Moby Dick' is not available, and no similar titles were found.";
    got = check_book_availability(['The Great Gatsby', '1984', 'To Kill a Mockingbird'], 'Moby Dick');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = "The book 'the great gatsby' is available.";
    got = check_book_availability(['The Great Gatsby', '1984', 'To Kill a Mockingbird'], 'the great gatsby');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = "The book 'great' is not available. Did you mean: The Great Gatsby?";
    got = check_book_availability(['The Great Gatsby', '1984', 'To Kill a Mockingbird'], 'great');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = "The book 'Harry Potter' is not available. Did you mean: Harry Potter and the Sorcerer's Stone, Harry Potter and the Chamber of Secrets?";
    got = check_book_availability(["Harry Potter and the Sorcerer's Stone", 'Harry Potter and the Chamber of Secrets'], 'Harry Potter');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = "The book 'Any Book' is not available, and no similar titles were found.";
    got = check_book_availability([], 'Any Book');
    assert got == want, f"expected={want!r} actual={got!r}";
}
