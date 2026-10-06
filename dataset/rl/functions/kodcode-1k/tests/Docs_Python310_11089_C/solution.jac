"""
    Display a message box based on the provided type, title, and message.

    Parameters:
        box_type (str): Type of the message box to display.
                        One of {"info", "warning", "error", "question", "okcancel", "retrycancel", "yesno", "yesnocancel"}.
        title (str)   : Title of the message box.
        message (str) : Message to display in the message box.

    Returns:
        str: The user's response if applicable, otherwise a message acknowledging the action.
    """
def display_message_box(box_type: str, title: str, message: str) -> str {
    if (
        box_type
        not in {
            "info",
            "warning",
            "error",
            "question",
            "okcancel",
            "retrycancel",
            "yesno",
            "yesnocancel"
        }
    ) {
        return "Invalid message box type provided.";
    }
    mock_responses = {
        "question": "yes",
        "okcancel": "ok",
        "retrycancel": "retry",
        "yesno": "no",
        "yesnocancel": "cancel"
    };
    if (box_type in {"info", "warning", "error"}) {
        return f"{box_type.capitalize()} box displayed.";
    }
    return mock_responses[box_type];
}

