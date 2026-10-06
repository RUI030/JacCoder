"""
    Returns the state-th completion of the input text from the predefined namespace.
    """
def custom_completer(text: str, state: int) -> str | None {
    namespace = {
        "builtins": dir(__builtins__),
        "custom_objects": {
            "my_module": ["function_a", "function_b", "ClassA", "ClassB"]
        }
    };
    if ('.' not in text) {
        matches = [
            name
            for name in namespace["custom_objects"]
            if name.startswith(text)
        ];
    } else {
        parts = text.split('.');
        obj_name = parts[0];
        attr_name_prefix = parts[1];
        try {
            `obj = namespace["custom_objects"][obj_name];
        } except KeyError {
            return None;
        }
        matches = [
            attr
            for attr in `obj
            if attr.startswith(attr_name_prefix)
        ];
    }
    try {
        return matches[state];
    } except IndexError {
        return None;
    }
}

