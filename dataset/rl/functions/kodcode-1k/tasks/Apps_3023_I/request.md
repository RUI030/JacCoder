# largestRectangleArea

Given an array of integers representing the heights of bars in a histogram where the width of each bar is 1, design an algorithm to find the area of the largest rectangle that can be formed within the bounds of the histogram.

Example 1:

Input: [2,1,5,6,2,3]
Output: 10
Explanation: The largest rectangle can be formed between indices 2 and 3 (heights 5 and 6), with a width of 2. The area is therefore 5*2 = 10.

Example 2:

Input: [2,4]
Output: 4
Explanation: The largest rectangle is the single bar of height 4 and width 1. The area is therefore 4.

Example 3:

Input: [6,2,5,4,5,1,6]
Output: 12
Explanation: The largest rectangle is the one spanning indices 2 to 4 (heights 5, 4, and 5), with a width of 3. The area is therefore 4*3 = 12.

Example:
- `largestRectangleArea([2, 1, 5, 6, 2, 3]) == 10`

Implement `largestRectangleArea(heights: list[int]) -> int`.
