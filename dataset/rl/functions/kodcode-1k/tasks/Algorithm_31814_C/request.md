# concatenate_elimination

Concatenate the elements of two lists into a single string, excluding common characters.

Arguments:
list1 -- List containing the first set of single-character strings.
list2 -- List containing the second set of single-character strings.

Returns:
A string that is the result of concatenating the two lists after eliminating any character 
that is present in both lists.

Example:
>>> concatenate_elimination(['a', 'b', 'c'], ['b', 'd', 'e'])
'acde'

>>> concatenate_elimination(['m', 'n'], ['n', 'o'])
'mo'

Implement `concatenate_elimination(list1: list[str], list2: list[str]) -> str`.
