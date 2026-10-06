# max_contiguous_subsequence_sum

#### Objective

Implement a function to find the maximum sum of a contiguous subarray using Kadane's Algorithm. Your function should be efficient and handle various edge cases.

#### Context

You are given a list of integers representing stock prices over several days. You want to determine the maximum profit you could have achieved if you were allowed to buy and sell once during the period. Since you can only trade once, you're trying to maximize the difference between buying low and selling high on a single contiguous sub-period.

#### Implementation Requirements

* Implement a function **max_contiguous_subsequence_sum(arr: List[int]) -> int**.
* **Input**:
  - **arr** (List[int]): A list of integers representing stock prices.
* **Output**:
  - **int**: The maximum sum of a contiguous subsequence which represents the maximum possible profit.

#### Constraints

* The array can contain both positive and negative integers.
* The array can be empty.
* The array can contain duplicates.

#### Example Scenarios

1. **Example 1**:
    * **Input**: `[-2, 3, 8, -1, 4]`
    * **Output**: `14`
      - Explanation: The subarray `[3, 8, -1, 4]` gives the maximum sum of 14.
2. **Example 2**:
    * **Input**: `[-1, 1, 0]`
    * **Output**: `1`
      - Explanation: The subarray `[1]` gives the maximum sum of 1.
3. **Example 3**:
    * **Input**: `[-1, -3, -4]`
    * **Output**: `-1`
      - Explanation: The subarray `[-1]` gives the maximum sum of -1.
4. **Example 4**:
    * **Input**: `[-2, 3, 8, -12, 8, 4]`
    * **Output**: `12`
      - Explanation: The subarray `[8, 4]` gives the maximum sum of 12.

Example:
- `max_contiguous_subsequence_sum([]) == 0`

Implement `max_contiguous_subsequence_sum(arr: list[int]) -> int`.
