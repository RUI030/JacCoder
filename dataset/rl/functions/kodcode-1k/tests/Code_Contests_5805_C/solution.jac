"""
    Given battery capacities and device consumptions, calculate the maximum number of times
    each device can be used in a row without recharging using the highest capacity battery.

    :param n: Number of batteries
    :param m: Number of devices
    :param battery_capacities: List of integers representing battery capacities
    :param device_consumptions: List of integers representing device consumptions
    :return: List of integers representing the maximum number of usages for each device
    """
def max_usages(n: int, m: int, battery_capacities: list[int], device_consumptions: list[int]) -> list[int] {
    max_capacity = max(battery_capacities);
    return [(max_capacity // consumption) for consumption in device_consumptions];
}

