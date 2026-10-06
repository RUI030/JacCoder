import from main { validate_html_tags }

test "case 0" {
    want = True;
    got = validate_html_tags('<div><p></p></div>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = validate_html_tags('<div><p></div></p>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = validate_html_tags('<div><p></p>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = validate_html_tags('Hello <b>world</b>!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = validate_html_tags('Plain text without tags.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = validate_html_tags('<div>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = validate_html_tags('</div>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = validate_html_tags('<div><b></div></b>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = validate_html_tags('<a><b><c></c></b></a>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = validate_html_tags('<b><b></b></b>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = validate_html_tags('<a><b>text</b></a>plain text<a><b><c></c></b></a>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = validate_html_tags('<a>Hello<b>world!</b></a>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = validate_html_tags('<a>Hello<b>world!</a></b>');
    assert got == want, f"expected={want!r} actual={got!r}";
}
