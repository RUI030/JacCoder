# optimize_skyline

You are given a sequence of integers representing the heights of buildings in a city. An architect wants to optimize the skyline by ensuring that each building is no taller than the one to its left. To achieve this, buildings may need to be shortened, but cannot be made taller.

Write a Jac function named `optimize_skyline(heights: List[int]) -> List[int]` that adjusts the heights of the buildings to meet the requirements. The function should return a list of integers representing the new heights of the buildings. Each height in the returned list should be less than or equal to the height of the building immediately to its left in the original list.

Steps to solve the problem:
1. Iterate through the list of building heights starting from the first element.
2. For each building, if its height is greater than the height of the building to its left, reduce its height to match the height of the previous building.
3. Continue this process for all buildings in the list.
4. Return the modified list of building heights.

Example:
- `optimize_skyline([3, 2, 5, 4, 2]) == [3, 2, 2, 2, 2]`

Implement `optimize_skyline(heights: list[int]) -> list[int]`.
