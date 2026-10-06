import from main { sort_files }

test "case 0" {
    want = ['data.csv', 'Report.docx', 'analyzer.EXE', 'file.txt', 'file.TXT'];
    got = sort_files(['file.txt', 'file.TXT', 'analyzer.EXE', 'data.csv', 'Report.docx']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['image.jpeg', 'image.PNG', 'File.TXT'];
    got = sort_files(['image.jpeg', 'File.TXT', 'image.PNG']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['abc.EXE', 'a.TXT', 'b.txt', 'C.txt'];
    got = sort_files(['a.TXT', 'b.txt', 'C.txt', 'abc.EXE']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['file.A', 'file.a', 'File.B', 'file.b'];
    got = sort_files(['file.A', 'file.a', 'File.B', 'file.b']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['singlefile.txt'];
    got = sort_files(['singlefile.txt']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = sort_files([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
