import from main { extract_domain_name }

test "case 0" {
    want = 'github';
    got = extract_domain_name('http://github.com/SaadBenn');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'zombie-bites';
    got = extract_domain_name('http://www.zombie-bites.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'cnet';
    got = extract_domain_name('https://www.cnet.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'example';
    got = extract_domain_name('http://example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'example';
    got = extract_domain_name('www.example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'example';
    got = extract_domain_name('https://example.com/path/to/page');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'sub';
    got = extract_domain_name('http://sub.domain.com/path/to/page');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'sub';
    got = extract_domain_name('sub.domain.com/path/to/page');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'sub';
    got = extract_domain_name('http://www.sub.domain.com/path/to/page');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'sub';
    got = extract_domain_name('https://www.sub.domain.com/path/to/page');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'example';
    got = extract_domain_name('www.example.co.uk');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'example';
    got = extract_domain_name('example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 'sub';
    got = extract_domain_name('sub.example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}
