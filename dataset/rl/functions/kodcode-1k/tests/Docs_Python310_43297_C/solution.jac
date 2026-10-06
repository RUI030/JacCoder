"""
    Simulates the initialization of a Python interpreter with a given program name and utf-8 mode.

    Args:
    - program_name (str): The program name to be used in the initialization.
    - utf8_mode (int): A flag indicating whether utf-8 mode should be enabled (1) or not (0).

    Returns:
    - int: 0 if initialization is successful, or an appropriate exit code if an error occurs.
    """
def initialize_python_custom(program_name: str, utf8_mode: int) -> int {
    try {
        preconfig = {};
        preconfig['utf8_mode'] = utf8_mode;
        config = {};
        config['program_name'] = program_name;
        if (utf8_mode not in (0, 1)) {
            raise ValueError("utf8_mode must be 0 or 1");
        }
        if not isinstance(program_name, str) {
            raise ValueError("program_name must be a string");
        }
        print("Python interpreter initialized with program name:", program_name);
        print("UTF-8 mode:", "enabled" if (utf8_mode == 1) else "disabled");
        return 0;
    } except Exception as e {
        print(f"Initialization failed: {e}");
        return 1;
    }
}

