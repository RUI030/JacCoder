# check_compatibility

Checks the compatibility of asyncio operations with the specified platform
and event loop type in use.

Parameters:
- platform (str): The platform in use. One of "windows", "macos", "linux", "all".
- event_loop_type (str): The type of event loop being used. One of "selector", "proactor", "default".
- operation (str): The asyncio operation to check for compatibility.

Returns:
- bool: True if the operation is supported; otherwise False.

Example:
>>> check_compatibility("windows", "proactor", "subprocess_exec") 
True
>>> check_compatibility("macos", "selector", "add_reader")
True

Implement `check_compatibility(platform: str, event_loop_type: str, operation: str) -> bool`.
