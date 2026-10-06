def final_sequence_length(x: str, y: str) -> int {
    n = len(y);
    transformed_x = [];
    for (i, ch) in enumerate(x) {
        if ch.isalpha() {
            if ((i % 2) == 0) {
                transformed_x.append(ch.upper());
            } else {
                transformed_x.append(ch.lower());
            }
        } elif ch.isdigit() {
            transformed_x.append(y[(int(ch) % n)]);
        }
    }
    final_sequence = ''.join(transformed_x) + y[::-1];
    return len(final_sequence);
}

