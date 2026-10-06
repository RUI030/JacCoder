# min_ingredient_sum

Chef Anup is preparing a special type of drink composed of M ingredients, where the amount of each ingredient is represented by an integer. The task is to determine the smallest possible sum of amounts for a drink that satisfies the following two conditions:
1. The drink must contain at least P different types of ingredients.
2. The amount of each ingredient must be between a given minimum Q and maximum R inclusive.

Given the values M, P, Q, and R, you should calculate the smallest possible sum of the amounts of the ingredients.

------ Input Format ------

The first line of the input contains an integer T denoting the number of test cases. The description of T test cases follows.
Each test case description consists of a single line containing four integers M, P, Q, and R as described above.

------ Output Format ------

For each test case, print a single integer that represents the smallest possible sum of the amounts of the ingredients of the drink.

------ Constraints ------

$1 ≤ T ≤ 10$
$1 ≤ M ≤ 10^3$
$1 ≤ P ≤ M$
$1 ≤ Q ≤ R ≤ 10^3$

------ Sample Input 1 ------

4
5 3 1 5
4 2 2 4
6 4 1 3
7 5 2 6

------ Sample Output 1 ------

3
4
4
10

------ Explanation 1 ------

For the first test case, the smallest possible sums for 3 out of 5 ingredients, each being at least 1, results in a sum of 3 (1+1+1).
For the second test case, we need at least 2 ingredients, each being at least 2, resulting in a sum of 4 (2+2).
For the third test case, we need at least 4 ingredients, each being at least 1, resulting in a sum of 4 (1+1+1+1).
For the fourth test case, we need at least 5 ingredients, each being at least 2, resulting in a sum of 10 (2+2+2+2+2).

Example:
- `min_ingredient_sum(1, [(5, 3, 1, 5)]) == [3]`

Implement `min_ingredient_sum(T: int, test_cases: list[tuple[int, int, int, int]]) -> list[int]`.
