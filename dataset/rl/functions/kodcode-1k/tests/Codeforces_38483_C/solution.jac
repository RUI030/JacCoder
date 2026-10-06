def max_total_power(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int] {
    results = [];
    for i in range(t) {
        n = test_cases[i][0];
        stones = test_cases[i][1];
        fire_stones = stones[::2];
        water_stones = stones[1::2];
        total_power = sum(fire_stones) + sum(water_stones);
        results.append(total_power);
    }
    return results;
}

