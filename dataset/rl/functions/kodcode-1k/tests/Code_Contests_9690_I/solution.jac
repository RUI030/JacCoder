def can_plant_seedlings(t: int, cases: list[tuple[int, int]]) -> list[str] {
    results = [];
    for i in range(t) {
        (n, k) = cases[i];
        if (k == 0) {
            results.append("YES");
        } elif (k <= ((n + 1) // 2)) {
            results.append("YES");
        } else {
            results.append("NO");
        }
    }
    return results;
}

