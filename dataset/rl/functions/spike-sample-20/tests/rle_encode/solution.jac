def rle_encode(s: str) -> str {
    if not s {
        return "";
    }
    parts: list[str] = [];
    prev = s[0];
    count = 1;
    for ch in s[1:] {
        if ch == prev {
            count += 1;
        } else {
            parts.append(f"{count}{prev}");
            prev = ch;
            count = 1;
        }
    }
    parts.append(f"{count}{prev}");
    return "".join(parts);
}
