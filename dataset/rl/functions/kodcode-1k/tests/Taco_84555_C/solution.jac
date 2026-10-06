def track_books(t: int, test_cases: list[tuple[int, list[str]]]) -> list[str] {
    import from collections { OrderedDict }
    results = [];
    for i in range(t) {
        n = test_cases[i][0];
        titles = test_cases[i][1];
        book_counts = OrderedDict();
        for title in titles {
            if (title in book_counts) {
                book_counts[title] += 1;
            } else {
                book_counts[title] = 1;
            }
        }
        result = '\n'.join(
            [f"{title} {count}" for (title, count) in book_counts.items()]
        );
        results.append(result);
    }
    return results;
}

