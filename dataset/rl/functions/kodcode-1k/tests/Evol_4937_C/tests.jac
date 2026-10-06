import from main { highest_student_scores }

test "case 0" {
    want = {'Alice': 98, 'Bob': 85};
    got = highest_student_scores([('Alice', 92), ('Bob', 85), ('Alice', 98), ('Bob', 80)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'Alice': 75, 'Bob': 85};
    got = highest_student_scores([('Alice', 75), ('Bob', 85)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {};
    got = highest_student_scores([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'Alice': 80};
    got = highest_student_scores([('Alice', 80), ('Alice', 80)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'Alice': 95};
    got = highest_student_scores([('Alice', 90), ('Alice', 95), ('Alice', 85)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'Charlie': 90};
    got = highest_student_scores([('Charlie', 70), ('Charlie', 70), ('Charlie', 90), ('Charlie', 80)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
