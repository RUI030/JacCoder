# k_most_frequent

You are given a list of N integers where some of the integers are repeated. Your task is to identify the K most frequent elements in the list. If there are multiple elements with the same frequency, return the elements with the smallest values first.

------ Input ------ 

The first line contains two integers N (1 ≤ N ≤ 10^5) and K (1 ≤ K ≤ N).
The second line contains N integers separated by spaces which represent the list of elements.

------ Output ------ 

Output the K most frequent elements in the list in descending order of their frequency. If multiple elements have the same frequency, output them in ascending order of their values.

------ Sample Input 1 ------ 
7 3
4 1 2 2 3 3 3

------ Sample Output 1 ------ 
3 2 1

------ Sample Input 2 ------ 
8 2
5 5 5 4 4 4 3 3 2

------ Sample Output 2 ------ 
4 5

Example:
- `k_most_frequent(7, 3, [4, 1, 2, 2, 3, 3, 3]) == [3, 2, 1]`

Implement `k_most_frequent(n: int, k: int, elements: list[int]) -> list[int]`.
