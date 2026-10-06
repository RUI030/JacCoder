def max_points(q: int, test_cases: list[tuple[tuple[int, int], list[int]]]) -> list[int] {
    results = [];
    for `case in test_cases {
        (n, M) = `case[0];
        difficulties = `case[1];
        if (sum(difficulties) <= M) {
            results.append(sum(difficulties));
        } else {
            difficulties.sort(reverse=True);
            total_time = 0;
            max_points = 0;
            for d in difficulties {
                if ((total_time + d) <= M) {
                    total_time += d;
                    max_points += d;
                } else {
                    max_points += M - total_time;
                    break;
                }
            }
            results.append(max_points);
        }
    }
    return results;
}

