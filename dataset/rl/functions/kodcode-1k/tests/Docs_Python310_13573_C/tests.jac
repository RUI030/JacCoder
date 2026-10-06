import from main { decode_python_version }

test "case 0" {
    want = {'major': 3, 'minor': 4, 'micro': 1, 'release_level': 10, 'release_serial': 2};
    got = decode_python_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'major': 3, 'minor': 10, 'micro': 0, 'release_level': 15, 'release_serial': 0};
    got = decode_python_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'major': 0, 'minor': 0, 'micro': 0, 'release_level': 0, 'release_serial': 0};
    got = decode_python_version(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'major': 255, 'minor': 255, 'micro': 255, 'release_level': 15, 'release_serial': 15};
    got = decode_python_version(4294967295);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'major': 7, 'minor': 3, 'micro': 2, 'release_level': 11, 'release_serial': 1};
    got = decode_python_version(117637809);
    assert got == want, f"expected={want!r} actual={got!r}";
}
