# longestContiguousOnes

Given a binary string S, determine the length of the longest contiguous sequence of 1's. If the string does not contain any 1's, return 0.

Example 1:
Input:
S = "110011111011"
Output: 5
Explanation: The longest sequence of 1's is "11111" which has length 5.

Example 2:
Input:
S = "0000"
Output: 0
Explanation: The string does not contain any 1's, so the result is 0.

Your Task:
You don't need to read input or print anything. Complete the function longestContiguousOnes() which takes the binary string S as input parameters and returns the length of the longest contiguous sequence of 1's. If no such sequence is present, return 0.

Expected Time Complexity: O(|S|)
Expected Auxiliary Space: O(1)

Constraints:
1 ≤ |S| ≤ 10^{4}
0 ≤ output value ≤ |S|

Example:
- `longestContiguousOnes('110011111011') == 5`

Implement `longestContiguousOnes(S: str) -> int`.
