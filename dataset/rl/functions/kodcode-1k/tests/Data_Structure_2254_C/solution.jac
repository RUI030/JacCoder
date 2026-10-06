def is_anagram(s1: str, s2: str) -> bool {
    import re;
    import from collections { Counter }
    s1_filtered = re.sub(r'[^a-zA-Z]', '', s1).lower();
    s2_filtered = re.sub(r'[^a-zA-Z]', '', s2).lower();
    return (Counter(s1_filtered) == Counter(s2_filtered));
}

