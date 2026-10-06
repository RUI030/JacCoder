import from main { smallest_sequence_after_k_steps }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = smallest_sequence_after_k_steps([1, 2, 3, 4, 5], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 3, 1, 4, 5];
    got = smallest_sequence_after_k_steps([3, 2, 1, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3, 2, 4, 5];
    got = smallest_sequence_after_k_steps([3, 2, 1, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = smallest_sequence_after_k_steps([5, 4, 3, 2, 1], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 4, 2, 3, 5];
    got = smallest_sequence_after_k_steps([4, 2, 3, 1, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = smallest_sequence_after_k_steps([], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1];
    got = smallest_sequence_after_k_steps([1], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
