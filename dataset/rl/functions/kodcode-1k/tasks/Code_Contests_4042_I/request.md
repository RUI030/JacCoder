# find_difference

Alice and Bob are playing a game involving arrays of integers. They take turns to play, with Alice starting first. Given an array of `n` positive integers, they choose one element per turn and remove it from the array. The game ends when the array is empty. 

Alice's goal is to maximize the sum of elements that she picks, while Bob's goal is to maximize the sum of elements that he picks. They both play optimally. Write a function that returns the difference between the sums of elements picked by Alice and Bob if both play optimally.

Input

The input will be a single line containing `n` integers where `1 <= n <= 100` and each integer is between `1` and `1000`.

Output

Output the difference between the sum of elements picked by Alice and Bob if both play optimally.

Examples

Input

5 2 3 7 1

Output

6

Explanation

Alice starts and picks the largest element 7. The array becomes: [5, 2, 3, 1].

Bob then picks the next largest element 5. The array becomes: [2, 3, 1].

Alice picks 3. The array becomes: [2, 1].

Bob picks 2. The array becomes: [1].

Alice picks the remaining element 1.

Alice's total sum is 7 + 3 + 1 = 11.

Bob's total sum is 5 + 2 = 7.

The difference is 11 - 7 = 4.

Another Example

Input

9 8 3 6 4

Output

8

Explanation

Alice starts and picks the largest element 9. The array becomes: [8, 3, 6, 4].

Bob then picks the next largest element 8. The array becomes: [3, 6, 4].

Alice picks 6. The array becomes: [3, 4].

Bob picks 4. The array becomes: [3].

Alice picks the remaining element 3.

Alice's total sum is 9 + 6 + 3 = 18.

Bob's total sum is 8 + 4 = 12.

The difference is 18 - 12 = 6.

Example:
- `find_difference([5, 2, 3, 7, 1]) == 4`

Implement `find_difference(arr: list[int]) -> int`.
