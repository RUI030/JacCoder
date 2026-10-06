# min_insertions_to_balance

Emma has a string s consisting of lowercase English letters. She wants to make this string as balanced as possible.
A string is considered balanced if the absolute difference in the number of occurrences of any two characters 
in the string is at most 1. Emma can insert any character in the string at any position she chooses. 
Help Emma determine the minimum number of insertions required to make the string balanced.

Args:
t (int): The number of test cases.
test_cases (List[str]): List of strings for which Emma wants to determine the minimum number of insertions.

Returns:
List[int]: The minimum number of insertions required for each test case.

Examples:
>>> min_insertions_to_balance(2, ["abcbc", "aabbccc"])
[1, 2]
>>> min_insertions_to_balance(1, ["aaaa"])
[0]

Implement `min_insertions_to_balance(t: int, test_cases: list[str]) -> list[int]`.
