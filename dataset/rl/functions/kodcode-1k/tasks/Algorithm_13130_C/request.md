# normalize_text

Normalize the string by changing all characters to lowercase,
removing extra spaces, and ensuring a single space between words.

>>> normalize_text(" Hello   World ") "hello world"
>>> normalize_text("This    is    a Test   String") "this is a test string"

Implement `normalize_text(text: str) -> str`.
