# is_valid_markup

Determine if the input string 's' is valid according to the custom markup language.
Valid structures follow the patterns: <tag></tag> and [link][/link].

>>> is_valid_markup("<tag>content here</tag>") == True
>>> is_valid_markup("[link]<tag>link within tag</tag>[/link]") == True

Implement `is_valid_markup(s: str) -> bool`.
