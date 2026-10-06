"""
    Checks if the given plan supports the required number of concurrent streams.

    :param plan: The subscription plan (Basic, Standard, Premium).
    :param num_streams: The number of concurrent streams the user wants.
    :return: True if the plan supports the number of concurrent streams, False otherwise.
    """
def check_plan(plan: str, num_streams: int) -> bool {
    plans = {"Basic": 1, "Standard": 2, "Premium": 4};
    if (plan in plans) {
        return (num_streams <= plans[plan]);
    }
    return False;
}

