# conveyor_belt_sequence

Determines if the conveyor belt can produce the target sequence
by analyzing if the target sequence appears in the belt, considering its cyclic behavior.

>>> conveyor_belt_sequence("abcde", "cdeab") True
>>> conveyor_belt_sequence("xyz", "zyx") False

Implement `conveyor_belt_sequence(belt: str, target_sequence: str) -> bool`.
