import from main { summarize_list_elements }

test "case 0" {
    want = {'positive': 5, 'negative': 0, 'zero': 0, 'even': 2, 'odd': 3, 'sum': 15};
    got = summarize_list_elements([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'positive': 0, 'negative': 5, 'zero': 0, 'even': 2, 'odd': 3, 'sum': -15};
    got = summarize_list_elements([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'positive': 2, 'negative': 2, 'zero': 1, 'even': 3, 'odd': 2, 'sum': 0};
    got = summarize_list_elements([0, 1, 2, -1, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'positive': 3, 'negative': 1, 'zero': 1, 'even': 2, 'odd': 3, 'sum': 5};
    got = summarize_list_elements([1, -1, 0, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'positive': 0, 'negative': 0, 'zero': 0, 'even': 0, 'odd': 0, 'sum': 0};
    got = summarize_list_elements([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'positive': 0, 'negative': 0, 'zero': 3, 'even': 3, 'odd': 0, 'sum': 0};
    got = summarize_list_elements([0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
