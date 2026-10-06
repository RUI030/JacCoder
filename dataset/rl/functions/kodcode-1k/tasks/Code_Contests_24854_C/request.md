# rearrange_string

Determine if it's possible to rearrange the characters of the string such that the distance between any two identical characters is at least k.
Return the lexicographically smallest possible rearrangement if it is possible, otherwise return "impossible".

>>> rearrange_string("aabbcc", 2)
'abcabc'

>>> rearrange_string("aaab", 2)
'impossible'

Implement `rearrange_string(s: str, k: int) -> str`.
