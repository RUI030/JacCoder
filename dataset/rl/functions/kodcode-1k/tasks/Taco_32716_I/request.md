# elevation_difference

Farmers in a hilly region use a traditional method to estimate the elevation of a point based on temperature differences. They believe that for every 100 meters of elevation gain, the temperature typically drops about 0.6 degrees Celsius. Knowing this, they use a simplified way to calculate the estimated elevation gain.

You have current temperature readings from two points. You need to calculate the estimated elevation difference between these two points using the formula:
\[E = \frac{T_1 - T_2}{0.006}\]
where \(T_1\) is the temperature at the lower point, \(T_2\) is the temperature at the higher point, and \(E\) is the elevation difference in meters.

Write a program to calculate and print the estimated elevation difference between two points.

**Input**

The input is given in the following format.

T1 T2

The input line provides two integers: 

* \(T_1\) ($-50 \leq T_1 \leq 50$), the temperature at the lower point in degrees Celsius, and
* \(T_2\) ($-50 \leq T_2 \leq 50$), the temperature at the higher point in degrees Celsius.

**Output**

Output the estimated elevation difference in whole meters, rounded to the nearest integer.

**Examples**

**Input**
20 15

**Output**
833

**Input**
12 9

**Output**
500

Example:
- `elevation_difference(20, 15) == 833`

Implement `elevation_difference(T1: int, T2: int) -> int`.
