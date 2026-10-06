def most_frequent_extension(n: int, files: list[str]) -> str {
    import from collections { Counter }
    extensions = [];
    for file in files {
        parts = file.split('/');
        last_part = parts[-1];
        if ('.' in last_part) {
            ext = last_part.split('.')[-1];
            if ext {
                extensions.append(ext);
            }
        }
    }
    if not extensions {
        return "";
    }
    counter = Counter(extensions);
    max_count = max(counter.values());
    most_frequent_extensions = [
        ext
        for (ext, count) in counter.items()
        if (count == max_count)
    ];
    return min(most_frequent_extensions);
}

