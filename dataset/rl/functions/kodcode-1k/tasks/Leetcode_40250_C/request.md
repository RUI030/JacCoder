# can_transform

Determines if string s can be transformed into string t by changing any character in s to any other character.

Since we can change any character in s to any character,
we can transform s to t as long as their lengths are the same,
which is specified in the problem statement.

>>> can_transform("abc", "abc") == True
>>> can_transform("abc", "def") == True

Implement `can_transform(s: str, t: str) -> bool`.
