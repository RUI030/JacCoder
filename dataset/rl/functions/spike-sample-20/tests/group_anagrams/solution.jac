def group_anagrams(words: list[str]) -> list[list[str]] {
    groups: dict[str, list[str]] = {};
    for w in words {
        key = "".join(sorted(w));
        groups.setdefault(key, []).append(w);
    }
    result = [sorted(g) for g in groups.values()];
    return sorted(result);
}
