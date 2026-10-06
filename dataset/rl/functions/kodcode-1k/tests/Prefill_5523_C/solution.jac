"""
    Returns True if all addresses in the list are distinct, otherwise False.

    :param addresses: List of addresses (strings)
    :return: Boolean
    """
def are_addresses_distinct(addresses: list[str]) -> bool {
    return (len(addresses) == len(`set(addresses)));
}

