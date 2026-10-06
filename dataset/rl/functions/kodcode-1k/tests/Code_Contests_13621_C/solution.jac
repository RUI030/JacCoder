"""
    Determines if the typed string can be transformed into the target string by possibly adding one extra
    character to each key press.

    Parameters:
        target (str): The string that Alice wants to type.
        typed (str): The string that Alice has actually typed.

    Returns:
        str: "YES" if the typed string can be transformed into the target string, "NO" otherwise.
    """
def can_transform(target: str, typed: str) -> str {
    (i, j) = (0, 0);
    while ((i < len(target)) and (j < len(typed))) {
        if (target[i] == typed[j]) {
            i += 1;
            j += 1;
        } elif (((j + 1) < len(typed)) and (typed[(j + 1)] == target[i])) {
            j += 1;
        } else {
            return "NO";
        }
    }
    if (i == len(target)) {
        return "YES";
    } else {
        return "NO";
    }
}

