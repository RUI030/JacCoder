"""
    Checks the compatibility of asyncio operations with the specified platform
    and event loop type in use.

    Parameters:
    - platform (str): The platform in use. One of "windows", "macos", "linux", "all".
    - event_loop_type (str): The type of event loop being used. One of "selector", "proactor", "default".
    - operation (str): The asyncio operation to check for compatibility.

    Returns:
    - bool: True if the operation is supported; otherwise False.
    """
def check_compatibility(platform: str, event_loop_type: str, operation: str) -> bool {
    compatibility_matrix = {
        "windows": {
            "selector": {"supported_operations": `set()},
            "proactor": {
                "supported_operations": {
                    "subprocess_exec",
                    "subprocess_shell",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "add_signal_handler",
                    "remove_signal_handler"
                }
            },
            "default": {
                "supported_operations": {
                    "subprocess_exec",
                    "subprocess_shell",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "add_signal_handler",
                    "remove_signal_handler"
                }
            }
        },
        "macos": {
            "selector": {
                "supported_operations": {
                    "create_unix_connection",
                    "create_unix_server",
                    "add_signal_handler",
                    "remove_signal_handler",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "subprocess_exec",
                    "subprocess_shell"
                }
            },
            "proactor": {"supported_operations": `set()},
            "default": {
                "supported_operations": {
                    "create_unix_connection",
                    "create_unix_server",
                    "add_signal_handler",
                    "remove_signal_handler",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "subprocess_exec",
                    "subprocess_shell"
                }
            }
        },
        "linux": {
            "selector": {
                "supported_operations": {
                    "create_unix_connection",
                    "create_unix_server",
                    "add_signal_handler",
                    "remove_signal_handler",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "subprocess_exec",
                    "subprocess_shell"
                }
            },
            "proactor": {"supported_operations": `set()},
            "default": {
                "supported_operations": {
                    "create_unix_connection",
                    "create_unix_server",
                    "add_signal_handler",
                    "remove_signal_handler",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "subprocess_exec",
                    "subprocess_shell"
                }
            }
        },
        "all": {
            "selector": {
                "supported_operations": {
                    "create_unix_connection",
                    "create_unix_server",
                    "add_signal_handler",
                    "remove_signal_handler",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "subprocess_exec",
                    "subprocess_shell"
                }
            },
            "proactor": {
                "supported_operations": {
                    "subprocess_exec",
                    "subprocess_shell",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "add_signal_handler",
                    "remove_signal_handler"
                }
            },
            "default": {
                "supported_operations": {
                    "create_unix_connection",
                    "create_unix_server",
                    "add_signal_handler",
                    "remove_signal_handler",
                    "add_reader",
                    "add_writer",
                    "connect_read_pipe",
                    "connect_write_pipe",
                    "subprocess_exec",
                    "subprocess_shell"
                }
            }
        }
    };
    return (
        operation
        in compatibility_matrix[platform][event_loop_type]["supported_operations"]
    );
}

