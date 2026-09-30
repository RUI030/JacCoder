# Greedy word wrap

Implement `wrap_text(text: str, width: int) -> list[str]`. Split `text` on
whitespace into words and fill lines greedily: put as many words on a line as fit
within `width` characters, separated by single spaces. A word longer than `width`
goes on its own line unbroken. Return the lines; empty text gives `[]`.

Example:
- `wrap_text("the quick brown fox", 10) == ["the quick", "brown fox"]`
