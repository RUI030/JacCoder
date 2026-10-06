# is_unique_sum_possible

In a faraway kingdom, there is a unique type of currency consisting of coins of various values. The kingdom's treasurer, Sir Alfred, is responsible for ensuring that the vault is always securely organized. He has a peculiar way of distributing coins which he believes ensures maximum security. 

Given a list of coin values, Sir Alfred wants to distribute all the coins such that each possible sum of selected coins is unique. This means, if he picks coins with values A and B, the sum of their values (A + B) should not be the same as the sum of the values of any other distinct selection of coins. 

However, Sir Alfred is stuck and needs your help. Write a program to determine if it is possible to distribute the coins in such a way that every possible sum of any subset of the coins is unique.

### Input

- The first line contains an integer n (1 ≤ n ≤ 15) representing the number of different coin values.
- The second line contains n space-separated integers a1, a2, ..., an (1 ≤ ai ≤ 1000) representing the values of the coins.

### Output

- Print "YES" if it is possible to distribute the coins so that every possible sum of any subset of the coins is unique.
- Print "NO" otherwise.

### Examples

#### Input

5
1 1 3 3 6

#### Output

NO

#### Input

4
1 2 4 8

#### Output

YES

### Note

In the first example, it's not possible to ensure all sums are unique because there are duplicate coin values (1 and 3), which will lead to the same sums appearing more than once for different subsets. 

In the second example, every subset sum of coins will be unique. For instance, you could get sums such as 1, 2, 4, 8, 3, 5, 9, etc., each of which appears only once from the subsets of given coins.

Example:
- `is_unique_sum_possible(5, [1, 1, 3, 3, 6]) == 'NO'`

Implement `is_unique_sum_possible(n: int, coin_values: list[int]) -> str`.
