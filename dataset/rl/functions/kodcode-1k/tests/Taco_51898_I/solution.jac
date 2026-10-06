def can_construct_pattern(t: int, test_cases: list[tuple[int, list[int]]]) -> list[str] {
    results = [];
    for i in range(t) {
        (n, beads) = test_cases[i];
        possible = True;
        used_colors = `set();
        prev_color = None;
        for bead in beads {
            if (bead != prev_color) {
                if (bead in used_colors) {
                    possible = False;
                    break;
                }
                used_colors.add(bead);
                prev_color = bead;
            }
        }
        results.append("YES" if possible else "NO");
    }
    return results;
}

