# smallestNonRepresentableSum

Mr. Wayne owns a collection of N coins, each with a certain value represented in an array V[]. He wants to find out the smallest sum of money that cannot be formed using any subset of these coins. Help Mr. Wayne determine this value.

Example 1:
Input:
N=5
V[] = {1, 1, 3, 4, 6}
Output:
16
Explanation:
All sums from 1 to 15 can be created using subsets of the given coins, but 16 cannot.

Example 2:
Input:
N=3
V[] = {1, 2, 2}
Output:
6
Explanation:
All sums from 1 to 5 can be created using subsets of the given coins, but 6 cannot.

Your Task:
You don't need to read input or print anything. Your task is to complete the function smallestNonRepresentableSum() which takes the array V[] and its size N as inputs and returns the smallest sum that cannot be represented using any subset of the coins.

Expected time complexity: O(N log N)
Expected space complexity: O(1)

Constraints:
1 ≤ N ≤ 10^6
1 ≤ V[i] ≤ 10^9

Example:
- `smallestNonRepresentableSum(5, [1, 1, 3, 4, 6]) == 16`

Implement `smallestNonRepresentableSum(N: int, V: list[int]) -> int`.
