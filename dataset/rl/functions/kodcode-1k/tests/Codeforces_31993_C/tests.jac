import from main { longest_empty_segment }

test "case 0" {
    want = [4];
    got = longest_empty_segment(1, ['....#..#...']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 4, 3];
    got = longest_empty_segment(3, ['..##...#..##.', '##.##....', '..###..#...###...#.']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0];
    got = longest_empty_segment(1, ['#####']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [7];
    got = longest_empty_segment(1, ['.......']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4];
    got = longest_empty_segment(1, ['...#.#....#.#....###..']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [6];
    got = longest_empty_segment(1, ['..#......#']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
