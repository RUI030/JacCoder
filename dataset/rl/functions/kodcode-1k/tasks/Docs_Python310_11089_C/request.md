# display_message_box

Create a helper function that will present different types of message boxes based on input parameters.

Parameters:
    box_type (str): Type of the message box to display ("info", "warning", "error", "question", "okcancel", 
                    "retrycancel", "yesno", "yesnocancel").
    title (str): The title of the message box.
    message (str): The message to display in the message box.

Returns:
    str: The user’s response if applicable, otherwise a message acknowledging the action.

Example:
>>> display_message_box('yesnocancel', 'Exit Confirmation', 'Are you sure you want to exit?')
'yes'

Implement `display_message_box(box_type: str, title: str, message: str) -> str`.
