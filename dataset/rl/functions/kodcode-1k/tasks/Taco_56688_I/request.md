# calculate_final_water_flow

The city park has a unique water fountain system that operates on a specific condition. The fountain has an adjustable nozzle which can increase or decrease the water flow based on the temperature and time of the day. The main control panel receives three inputs: T (for temperature in degrees Celsius), H (for hour of the day in 24-hour format), and W (initial water flow rate in liters/minute).

The flow rate of the water changes according to the following rules:
1. If the temperature is above 30 degrees Celsius, the flow rate is doubled.
2. If the hour is between 6:00 AM and 6:00 PM (inclusive), the flow rate is increased by 50%.
3. If both conditions are met, the adjustments are applied sequentially (first doubling, then increasing by 50%).

Given these inputs, you are to calculate and output the final water flow rate.

Input

The first line of input contains an integer T for the temperature.

The second line of input contains an integer H for the hour of the day in 24-hour format.

The third line of input contains an integer W for the initial water flow rate.

Output

Print a single integer F representing the final water flow rate.

SAMPLE INPUT
32
14
100

SAMPLE OUTPUT
300

Explanation

The temperature is above 30, so the flow rate is doubled to 200 liters/minute.

The hour is within 6:00 AM and 6:00 PM, so the doubled flow rate is increased by 50%.

200 increased by 50% is 300.

Final water flow rate = 300 liters/minute.

Example:
- `calculate_final_water_flow(32, 10, 100) == 300`

Implement `calculate_final_water_flow(T: int, H: int, W: int) -> int`.
