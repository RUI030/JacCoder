import from main { custom_bucket_sort }

test "case 0" {
    want = [];
    got = custom_bucket_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0.5];
    got = custom_bucket_sort([0.5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0.1, 0.9];
    got = custom_bucket_sort([0.9, 0.1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0.12, 0.23, 0.29, 0.36, 0.45];
    got = custom_bucket_sort([0.23, 0.45, 0.12, 0.36, 0.29]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0.5, 0.5, 0.5, 0.5];
    got = custom_bucket_sort([0.5, 0.5, 0.5, 0.5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0.5, 0.6, 0.7, 0.8, 0.9];
    got = custom_bucket_sort([0.9, 0.8, 0.7, 0.6, 0.5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
