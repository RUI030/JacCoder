# Count word frequencies

Implement `word_frequency(text: str) -> dict[str, int]`. Split `text` on
whitespace, lowercase each word, strip the characters `.,!?;:` from both ends of
each word, drop words that become empty, and count how often each word occurs.

Example:
- `word_frequency("Hi hi, there!") == {"hi": 2, "there": 1}`
