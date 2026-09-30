# Flatten a nested dict into dotted keys

Implement `dotted_keys(d: dict) -> dict[str, int]`. The input maps string keys to
either an `int` or another dict of the same shape. Return a flat dict whose keys are
the paths to every `int`, joined with `.`. An empty nested dict contributes nothing.

Example:
- `dotted_keys({"a": 1, "b": {"c": 2}}) == {"a": 1, "b.c": 2}`
