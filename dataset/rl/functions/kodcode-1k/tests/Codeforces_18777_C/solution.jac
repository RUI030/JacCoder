"""
    Returns the minimum number of sensors required to cover an n x m grid with sensors
    that have detection range d in all 8 directions.
    """
def min_sensors(n: int, m: int, d: int) -> int {
    step = d + 1;
    sensors_in_rows = ((n + step) - 1) // step;
    sensors_in_columns = ((m + step) - 1) // step;
    return (sensors_in_rows * sensors_in_columns);
}

