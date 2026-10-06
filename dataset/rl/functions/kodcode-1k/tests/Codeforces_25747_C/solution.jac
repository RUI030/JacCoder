def min_height_binary_tree(n: int, depths: list[int]) -> int {
    import from collections { Counter }
    depth_count = Counter(depths);
    max_depth = max(depths);
    current_height = 0;
    for depth in range(1, (max_depth + 1)) {
        if (depth_count[depth] > 0) {
            current_height = max(current_height, depth);
        }
    }
    return current_height;
}

