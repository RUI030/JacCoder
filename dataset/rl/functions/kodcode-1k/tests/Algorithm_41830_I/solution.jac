"""
    Simplifies the given Unix-style path and returns the canonical path.

    :param path: str - The absolute Unix-style path to simplify.
    :return: str - The simplified canonical path.
    """
def simplify_path(path: str) -> str {
    components = path.split('/');
    stack = [];
    for component in components {
        if ((component == '') or (component == '.')) {
            continue;
        } elif (component == '..') {
            if stack {
                stack.pop();
            }
        } else {
            stack.append(component);
        }
    }
    simplified_path = '/' + '/'.join(stack);
    if (len(simplified_path) > 1) {
        simplified_path = simplified_path.rstrip('/') + '/';
    }
    return simplified_path;
}

