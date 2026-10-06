import from typing { List, Tuple }
import itertools;
def process_strings(strings_list: list[str]) -> list[tuple[str, int]] {
    result = [];
    for (key, group) in itertools.groupby(strings_list) {
        length = sum(1 for _ in group);
        result.append((key, length));
    }
    return result;
}

