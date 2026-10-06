import from main { most_frequent_extension }

test "case 0" {
    want = 'pdf';
    got = most_frequent_extension(1, ['docs/report.pdf']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'pdf';
    got = most_frequent_extension(7, ['docs/report.pdf', 'imgs/photo.jpg', 'docs/notes.txt', 'archive.tar.gz', 'scripts/run.sh', 'logs/', 'docs/draft.pdf']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'jpg';
    got = most_frequent_extension(6, ['docs/report.pdf', 'imgs/photo.jpg', 'docs/notes.txt', 'docs/another.pdf', 'imgs/another.jpg', 'docs/another.txt']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = most_frequent_extension(3, ['folder1/', 'folder2/', 'folder3/']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'txt';
    got = most_frequent_extension(4, ['docs/filename.txt', 'docs/filename1.Txt', 'docs/filename2.txt', 'docs/filename3.txt']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'txt';
    got = most_frequent_extension(5, ['docs/filename.txt', 'docs/filename1.Txt', 'docs/filename2.txt', 'docs/filename3.txt', 'docs/readme.md']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = most_frequent_extension(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}
