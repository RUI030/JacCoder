# is_loading_possible

A logistics company needs to distribute loads to a set of delivery trucks lined up in a sequence. Each truck has a maximum weight capacity and current weight already loaded. The company has a new load of items which are also given in sequence, and they need to be distributed to the trucks.

Each item can only be loaded onto a truck if it does not exceed the truck's remaining capacity. The loading must be done in the order given - you cannot skip an item. You should determine if it's possible to load all items into the trucks following these rules and, if so, distribute them. If it is not possible, indicate that it cannot be done.


Constraints:

* 1 ≤ N ≤ 100 (number of trucks)
* 1 ≤ M ≤ 100 (number of items)
* 1 ≤ current_weight[i], max_weight[i] ≤ 100 for 1 ≤ i ≤ N
* 1 ≤ item_weight[j] ≤ 100 for 1 ≤ j ≤ M
* All input values are integers.

Input:

The input is given from Standard Input in the following format:


N M

current_weight[1] max_weight[1] current_weight[2] max_weight[2] ... current_weight[N] max_weight[N]

item_weight[1] item_weight[2] ... item_weight[M]


Output:

Print `YES` if all items can be loaded into the trucks without violating the capacity constraints. Otherwise, print `NO`.

Examples

Input:

3 3

10 15 8 12 5 5

2 3 4

Output:

YES

Input:

2 2

8 10 10 12

5 3

Output:

NO

Example:
- `is_loading_possible(3, 3, [10, 8, 5], [15, 12, 5], [2, 3, 4]) == 'YES'`

Implement `is_loading_possible(N: int, M: int, current_weights: list[int], max_weights: list[int], item_weights: list[int]) -> str`.
