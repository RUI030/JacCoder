def is_loading_possible(N: int, M: int, current_weights: list[int], max_weights: list[int], item_weights: list[int]) -> str {
    truck_index = 0;
    for item in item_weights {
        while (
            (truck_index < N)
            and ((item + current_weights[truck_index]) > max_weights[truck_index])
        ) {
            truck_index += 1;
        }
        if (truck_index >= N) {
            return "NO";
        }
        current_weights[truck_index] += item;
    }
    return "YES";
}

