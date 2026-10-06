import from typing { Any }
"""
    This function finds the length of the longest substring that can be made by deleting at most k characters.

    :param s: The input string consisting of only lowercase alphabets
    :param k: The number of characters that can be deleted
    :return: The length of the longest possible substring
    """
def longest_substring_with_k_deletions(s: str, k: int) -> int {
    import from collections { defaultdict }
    char_count = defaultdict(int);
    for char in s {
        char_count[char] += 1;
    }
    sorted_chars = sorted(
        char_count.items(), key=lambda (x: Any) { x[1]; }, reverse=True
    );
    total_length = len(s);
    deletions = 0;
    for (char, count) in sorted_chars {
        if ((deletions + count) <= k) {
            deletions += count;
            total_length -= count;
        } else {
            total_length -= k - deletions;
            break;
        }
    }
    return max(0, total_length);
}

