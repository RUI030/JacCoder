import from main { count_islands }

test "empty grid" {
    want = 0;
    got = count_islands([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "all water" {
    want = 0;
    got = count_islands(["...", "..."]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "diagonal not connected" {
    want = 2;
    got = count_islands(["#.", ".#"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "one big island" {
    want = 1;
    got = count_islands(["###", "#.#", "###"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "snake shape" {
    want = 1;
    got = count_islands(["#.###", "#.#.#", "###.#"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "many singles" {
    want = 6;
    got = count_islands(["#.#.#", ".....", "#.#.#"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
