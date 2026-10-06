# can_transform

Determines if the typed string can be transformed into the target string by possibly adding one extra
character to each key press.

Parameters:
    target (str): The string that Alice wants to type.
    typed (str): The string that Alice has actually typed.

Returns:
    str: "YES" if the typed string can be transformed into the target string, "NO" otherwise.

>>> can_transform("hello", "heelllo")
"YES"
>>> can_transform("world", "worlld")
"YES"

Implement `can_transform(target: str, typed: str) -> str`.
