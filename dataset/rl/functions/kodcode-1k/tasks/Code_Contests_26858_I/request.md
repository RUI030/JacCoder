# is_treasure_code

A group of students is participating in a treasure hunt game, where they need to unlock a hidden treasure chest. The chest is locked with a special lock that operates on numerical codes. The code to unlock the chest is a specific permutation of a given sequence of numbers. The permutation must be in a strictly increasing order followed by a strictly decreasing order.

For example, if the given sequence is `1 2 3`, a valid permutation would be `1 2 3 2 1`, and for `3 3 3`, a valid permutation would be `3 3 3`.

Your task is to help the students determine if there exists such a permutation for the given sequence.

Input
A single line containing space-separated integers representing the sequence.

Output
A single line containing YES/NO in capital letters of the English alphabet.

Constraints
- The length of the sequence is in the range [1, 10^5].
- Each integer in the sequence is between 1 and 10^9.

Example
Input:
1 3 5 5 3 1

Output:
YES

Explanation
A valid permutation is `1 3 5 5 3 1` itself. Another possible permutation is `1 3 5 5 1 1`. Both of these are valid as they fit the required pattern of strictly increasing followed by strictly decreasing sequence.

Example:
- `is_treasure_code([1, 3, 5, 5, 3, 1]) == 'YES'`

Implement `is_treasure_code(sequence: list[int]) -> str`.
