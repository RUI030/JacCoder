# select_event_loop

Determines the appropriate asyncio event loop for the given platform and version constraints.

Parameters:
- platform_name (str): The platform name ('Windows', 'macOS', etc.)
- version (float): The version number of the operating system

Returns:
- str: The name of the most compatible asyncio event loop.

>>> select_event_loop('Windows', 10.0)
'ProactorEventLoop'
>>> select_event_loop('macOS', 10.7)
'SelectSelector'

Implement `select_event_loop(platform_name: str, version: float) -> str`.
