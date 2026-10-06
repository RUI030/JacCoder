# custom_completer

Returns the state-th completion of the input text from the predefined namespace.
>>> custom_completer("my_mod", 0) == "my_module"
>>> custom_completer("my_mod", 1) == None

Implement `custom_completer(text: str, state: int) -> str | None`.
