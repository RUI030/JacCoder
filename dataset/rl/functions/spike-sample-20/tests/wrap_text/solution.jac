def wrap_text(text: str, width: int) -> list[str] {
    lines: list[str] = [];
    cur = "";
    for word in text.split() {
        if not cur {
            cur = word;
        } elif len(cur) + 1 + len(word) <= width {
            cur = cur + " " + word;
        } else {
            lines.append(cur);
            cur = word;
        }
    }
    if cur {
        lines.append(cur);
    }
    return lines;
}
