def is_valid_traffic(n: int, m: int, signals: list[int], connections: list[tuple[int, int]]) -> str {
    for (a, b) in connections {
        if ((signals[(a - 1)] == 1) and (signals[(b - 1)] == 1)) {
            return "INVALID";
        }
    }
    return "VALID";
}
with entry {
    n = 3;
    m = 2;
    signals = [1, 0, 1];
    connections = [(1, 2), (2, 3)];
    print(is_valid_traffic(n, m, signals, connections));
}

