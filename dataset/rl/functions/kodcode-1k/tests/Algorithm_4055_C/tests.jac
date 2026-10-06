import from main { process_operations }

test "case 0" {
    want = [9, 12, 15];
    got = process_operations([1, 2, 3], ['add 2', 'mul 3']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 10, 6];
    got = process_operations([4, 5, 6], ['delete 1', 'insert 10 1']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [5];
    got = process_operations([], ['add 2', 'insert 5 0']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [10, 20, 30];
    got = process_operations([10, 20, 30], ['delete -1']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10, 20, 30, 5];
    got = process_operations([10, 20, 30], ['insert 5 100']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [7, 8, 9];
    got = process_operations([1, 2, 3], ['add 1', 'add 2', 'add 3']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [5];
    got = process_operations([1], ['delete 0', 'insert 5 0']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 5];
    got = process_operations([1], ['delete 1', 'insert 5 1']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [2];
    got = process_operations([], ['insert 1 0', 'mul 2']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
