# min_cost_to_make_palindrome

Determine the minimum cost to make the string s a palindrome with the given costs for swap (x) and replacement (y).

Args:
n : int : length of the string
x : int : cost of a swap operation
y : int : cost of a replacement operation
s : str : input string consisting of letters 'a' and 'b'

Returns:
int : the minimum cost to make the string a palindrome

Examples:
>>> min_cost_to_make_palindrome(5, 3, 2, "ababa")
0
>>> min_cost_to_make_palindrome(6, 1, 2, "aaaaab")
1

Implement `min_cost_to_make_palindrome(n: int, x: int, y: int, s: str) -> int`.
