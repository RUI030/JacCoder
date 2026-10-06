# simulate_bacterial_growth

You are tasked with creating a function to simulate the growth of a bacterial colony under specific conditions. This function needs to calculate the population of bacteria after a given number of hours, with a doubling rate that changes at certain intervals.

The function `simulate_bacterial_growth(initial_population: int, hours: int) -> int` should be constructed to achieve this.

- **Function Signature**: `simulate_bacterial_growth(initial_population: int, hours: int) -> int`
- **Input**: 
  - The function takes two integers, `initial_population` which represents the starting population of the bacteria, and `hours` which represents the total number of hours to simulate.
- **Output**: 
  - The function should return an integer representing the population of the bacteria after the specified number of hours.

Here are the specific conditions to implement:
1. For the first 2 hours, the population doubles every hour.
2. For the next 3 hours, the population triples every hour.
3. For the remaining hours, the population quadruples every hour.

For example:
- If the initial_population is 100 and hours is 5, the function should calculate:
  - After 1 hour: 100 * 2 = 200
  - After 2 hours: 200 * 2 = 400
  - After 3 hours: 400 * 3 = 1200
  - After 4 hours: 1200 * 3 = 3600
  - After 5 hours: 3600 * 3 = 10800
- Therefore, the function should return 10800.

Use appropriate mathematical operations to implement the growth stages.

Example:
- `simulate_bacterial_growth(100, 0) == 100`

Implement `simulate_bacterial_growth(initial_population: int, hours: int) -> int`.
