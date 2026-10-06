"""
    Takes a list of commands where each command is one of 'AAA', 'BBB', or 'CCC'.
    Based on the commands, the function will guide the car with Move Ahead, Turn Left, or Turn Right respectively.

    :param commands: List of strings where each string is a command of length 3
    :return: A list of actions corresponding to each command
    """
def car_commands(commands: list[str]) -> list[str] {
    action_mapping = {'AAA': 'Move Ahead', 'BBB': 'Turn Left', 'CCC': 'Turn Right'};
    actions = [];
    for command in commands {
        action = action_mapping.get(command, None);
        if action {
            actions.append(action);
        } else {
            actions.append('Unknown Command');
        }
    }
    return actions;
}

