# string_lengths

Takes a list of strings and returns a dictionary with each string as a key
and the length of that string as the value. If the same string appears more
than once in the list, its length should be calculated each time.
>>> string_lengths(["hello"]) == {"hello": 5}
>>> string_lengths(["hello", "world"]) == {"hello": 5, "world": 5}

Implement `string_lengths(strings: list[str]) -> dict[str, int]`.
