"""
    Calculate the final water flow rate based on temperature T, hour H, and initial flow rate W.

    :param T: Temperature in degrees Celsius
    :param H: Hour of the day in 24-hour format
    :param W: Initial water flow rate in liters/minute
    :return: Final water flow rate in liters/minute
    """
def calculate_final_water_flow(T: int, H: int, W: int) -> int {
    if (T > 30) {
        W *= 2;
    }
    if (6 <= H <= 18) {
        W = int((W * 1.5));
    }
    return W;
}

