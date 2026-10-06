"""
    Determines the appropriate asyncio event loop for the given platform and version constraints.

    Parameters:
    - platform_name (str): The platform name ('Windows', 'macOS', etc.)
    - version (float): The version number of the operating system

    Returns:
    - str: The name of the most compatible asyncio event loop.
    """
def select_event_loop(platform_name: str, version: float) -> str {
    if (platform_name == 'Windows') {
        return 'ProactorEventLoop';
    } elif (platform_name == 'macOS') {
        if (version <= 10.8) {
            return 'SelectSelector';
        } else {
            return 'KqueueSelector';
        }
    } else {
        return 'UnknownEventLoop';
    }
}

