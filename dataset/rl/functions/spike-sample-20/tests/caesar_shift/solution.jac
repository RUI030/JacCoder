def caesar_shift(text: str, k: int) -> str {
    out: list[str] = [];
    for ch in text {
        if "a" <= ch <= "z" {
            out.append(chr((ord(ch) - ord("a") + k) % 26 + ord("a")));
        } elif "A" <= ch <= "Z" {
            out.append(chr((ord(ch) - ord("A") + k) % 26 + ord("A")));
        } else {
            out.append(ch);
        }
    }
    return "".join(out);
}
