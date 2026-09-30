def int_to_roman(n: int) -> str {
    table: list[tuple[int, str]] = [
        (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
        (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
    ];
    out: list[str] = [];
    for (value, sym) in table {
        while n >= value {
            out.append(sym);
            n -= value;
        }
    }
    return "".join(out);
}
