# maximum_candies

James has a collection of different candies, and he’d like to share them among his friends in a quite unusual way. He has n friends, positioned in a circular manner. Each friend must receive exactly one candy, and the amount of candies must be divisible by the number of friends so that every friend will get exactly n/2 friends on each side after he gets all his candy. No two friends should receive candies of the same amount.

The process to distribute the candies is as follows:
1. Pick one of the n friends to be the starting friend. He will receive the first candy.
2. Move clockwise around the circle, giving each successive friend a candy, each candy with an incremented candy amount.

James wants the sum of the candies given to each friend to be maximized. Can you help James figure out the maximum sum of the candies he can achieve according to the rules?

Input:
The input consists of a single integer n (3 ≤ n ≤ 1000) — the number of friends.

Output:
Output a single integer which is the maximum sum of the candies James can achieve.

Example

Input:
4

Output:
22

Explanation:
Here we have 4 friends positioned in a circular manner:
- 1st friend can get 1 candy
- 2nd friend gets 6 candies
- 3rd friend gets 7 candies
- 4th friend gets 8 candies

The sum is 1+6+7+8 = 22

Example:
- `maximum_candies(3) == 9`

Implement `maximum_candies(n: int) -> int`.
