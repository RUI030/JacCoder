# hasPairWithSum

Given an array of integers and a target sum, find whether there exist two distinct indices i and j in the array such that arr[i] + arr[j] equals the target sum.

Example 1:
Input:
N = 5
arr[] = {1, 2, 3, 4, 5}
target = 9
Output:
True
Explanation:
arr[3] + arr[4] = 4 + 5 = 9

Example 2:
Input:
N = 5
arr[] = {1, 2, 3, 4, 5}
target = 10
Output:
False
Explanation:
No two distinct indices i and j exist such that arr[i] + arr[j] equals the target sum.

Your Task:
You don't need to read input or print anything. Your task is to complete the function hasPairWithSum() which takes the integer array arr[], its size N, and the target sum as input parameters and returns "True" if there exist two distinct indices that together give the target sum else return "False".

Expected Time Complexity: O(N)
Expected Space Complexity: O(N)

Constraints:
1 ≤ N ≤ 10^5
-10^7 ≤ arr[i] ≤ 10^7
-10^7 ≤ target ≤ 10^7

Example:
- `hasPairWithSum([1, 2, 3, 4, 5], 5, 9) == True`

Implement `hasPairWithSum(arr: list[int], N: int, target: int) -> bool`.
