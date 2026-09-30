import from main { count_islands }

test "empty grid" { assert count_islands([]) == 0; }
test "all water" { assert count_islands(["...", "..."]) == 0; }
test "diagonal not connected" { assert count_islands(["#.", ".#"]) == 2; }
test "one big island" { assert count_islands(["###", "#.#", "###"]) == 1; }
test "snake shape" { assert count_islands(["#.###", "#.#.#", "###.#"]) == 1; }
test "many singles" { assert count_islands(["#.#.#", ".....", "#.#.#"]) == 6; }
