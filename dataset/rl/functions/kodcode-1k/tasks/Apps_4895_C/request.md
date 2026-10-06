# is_palindrome_permutation

Determine if any permutation of the string can form a palindrome.

Args:
s (str): Input string

Returns:
bool: True if any permutation can form a palindrome, False otherwise

Examples:
>>> is_palindrome_permutation("civic")
True
>>> is_palindrome_permutation("ivicc")
True

Unit Test:
def test_is_palindrome_permutation():
    assert is_palindrome_permutation("civic") == True
    assert is_palindrome_permutation("ivicc") == True
    assert is_palindrome_permutation("hello") == False
    assert is_palindrome_permutation("aabb") == True
    assert is_palindrome_permutation("a") == True
    assert is_palindrome_permutation("") == True
    assert is_palindrome_permutation("abcdefg") == False
    assert is_palindrome_permutation("aabbccc") == True
    assert is_palindrome_permutation("aaaaa") == True

Implement `is_palindrome_permutation(s: str) -> bool`.
