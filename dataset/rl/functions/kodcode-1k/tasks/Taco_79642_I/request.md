# min_containers

Alice is planning to host a party and has decided to buy several types of beverages for her guests. Each type of beverage is packed in containers of various sizes.

Alice wants to ensure that each guest receives exactly one full container of beverage. However, she also wants to ensure that the total number of containers she needs to buy is minimized, as she doesn't want to waste any leftover containers.

Given the number of guests and the sizes of the containers available for each type of beverage, help Alice determine the minimum number of containers she needs to buy such that each guest gets exactly one full container of any beverage.

---Input---

The first line contains an integer n (1 ≤ n ≤ 100) — the number of guests.

The second line contains an integer m (1 ≤ m ≤ 50) — the number of types of beverages.

The next m lines each contain an integer c_i (1 ≤ c_i ≤ 100) — the number of containers available for the i-th type of beverage.

---Output---

Print a single integer — the minimum number of containers Alice needs to buy so that each guest gets exactly one full container of any beverage.

---Example---

Input
10
3
6
3
2

Output
10

Input
5
4
1
2
3
1

Output
5

---Note---

In the first example, Alice has 10 guests and 3 types of beverages with 6, 3, and 2 containers available respectively. The optimal solution is to buy all available containers (6 + 3 + 1), totaling 10 containers, which is the exact number of guests.

In the second example, Alice has 5 guests and 4 types of beverages with 1, 2, 3, and 1 containers available respectively. The optimal solution is to buy one container from each of the first and fourth type, and three containers from the third type, totaling 5 containers, which matches the number of guests.

Example:
- `min_containers(10, 3, [6, 3, 2]) == 10`

Implement `min_containers(n: int, m: int, containers: list[int]) -> int`.
