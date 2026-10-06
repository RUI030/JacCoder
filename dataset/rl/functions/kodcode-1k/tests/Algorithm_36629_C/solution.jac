def least_interval(tasks: list[str], n: int) -> int {
    import from collections { Counter }
    if not tasks {
        return 0;
    }
    task_counts = `list(Counter(tasks).values());
    max_count = max(task_counts);
    max_count_tasks = task_counts.count(max_count);
    part_count = max_count - 1;
    part_length = n - (max_count_tasks - 1);
    empty_slots = part_count * part_length;
    available_tasks = len(tasks) - (max_count * max_count_tasks);
    idles = max(0, (empty_slots - available_tasks));
    return (len(tasks) + idles);
}

