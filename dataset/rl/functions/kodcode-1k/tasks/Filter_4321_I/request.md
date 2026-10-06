# car_commands

You've been tasked with creating a game where a player can input a sequence of text commands that guide a self-driving car driving around a virtual world. Each command is a string of length 3 consisting entirely of letter A, B, or C.  The car will either Move Ahead, Turn Left or Turn Right based on the text commands. You should note that each command only turns or moves the car by one position (unless it hits an obstacle, it can stop in its track in case of collision)

Example:
- `car_commands(['AAA', 'BBB', 'CCC']) == ['Move Ahead', 'Turn Left', 'Turn Right']`

Implement `car_commands(commands: list[str]) -> list[str]`.
