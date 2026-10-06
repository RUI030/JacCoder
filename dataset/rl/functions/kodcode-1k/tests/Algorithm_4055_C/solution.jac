"""
    Process a list of operations on the given list of integers.
    """
def process_operations(values: list[int], operations: list[str]) -> list[int] {
    for operation in operations {
        op = operation.split();
        command = op[0];
        if (command == "add") {
            x = int(op[1]);
            values = [(v + x) for v in values];
        } elif (command == "mul") {
            x = int(op[1]);
            values = [(v * x) for v in values];
        } elif (command == "delete") {
            d = int(op[1]);
            if (0 <= d < len(values)) {
                values.pop(d);
            }
        } elif (command == "insert") {
            x = int(op[1]);
            d = int(op[2]);
            if (0 <= d <= len(values)) {
                values.insert(d, x);
            } else {
                values.append(x);
            }
        }
    }
    return values;
}

