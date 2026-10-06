# strip_and_sort

Strips all special characters from the input string, converts all alphabetic characters to lowercase,
and then sorts all the characters in increasing order of their ASCII values.

Args:
input_str (str): The input string consisting of alpha-numeric and special characters.

Returns:
str: A new string containing sorted alpha-numeric characters in increasing ASCII order, all in lowercase.

Examples:
>>> strip_and_sort("He!lL7o W2or@lD!") 
'27dehllloorw'
>>> strip_and_sort("!!@@##$$%%^^&&**()") 
''

Implement `strip_and_sort(input_str: str) -> str`.
