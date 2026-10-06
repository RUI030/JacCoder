def process_strings(string_list: list[str]) -> list[str] {
    result_list = [];
    for expression in string_list {
        result = eval(expression);
        if isinstance(result, float) {
            result_str = f"{result:.2f}";
        } else {
            result_str = str(result);
        }
        result_list.append(f"{expression} = {result_str}");
    }
    return result_list;
}

