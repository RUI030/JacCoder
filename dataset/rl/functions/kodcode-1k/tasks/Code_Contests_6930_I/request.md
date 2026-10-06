# count_ways

Alice is interested in buying new books for her library. Her favorite bookstore has an interesting offer on books in a series. Specifically, the bookstore states that if you buy two consecutive books from a series, you get a discount. Alice can choose to buy any number of books from the series, but she must always buy books in consecutive order.

Given that the total number of books in the series is N and the number of books Alice wants to buy consecutively is K, calculate the number of different ways Alice can choose books such that the length of the consecutive sequence of books Alice buys is less than or equal to K.

For instance, if N = 5 and K = 3, the valid options for Alice are:

- 1 book: [1], [2], [3], [4], [5]
- 2 books: [1, 2], [2, 3], [3, 4], [4, 5]
- 3 books: [1, 2, 3], [2, 3, 4], [3, 4, 5]

Calculate the total number of ways Alice can buy the books.

Input

The input consists of a single line containing two integers N and K (1 ≤ N ≤ 1000, 1 ≤ K ≤ N).

Output

Print one integer, the total number of ways Alice can buy books such that the length of the consecutive sequence is less than or equal to K.

Examples

Input
5 3

Output
12

Input
4 2

Output
7

Note

In the first example, Alice can choose the following books:

- 1 book: [1], [2], [3], [4], [5] (5 ways)
- 2 books: [1, 2], [2, 3], [3, 4], [4, 5] (4 ways)
- 3 books: [1, 2, 3], [2, 3, 4], [3, 4, 5] (3 ways)

In total, there are 5 + 4 + 3 = 12 ways.

In the second example, Alice can choose the following books:

- 1 book: [1], [2], [3], [4] (4 ways)
- 2 books: [1, 2], [2, 3], [3, 4] (3 ways)

In total, there are 4 + 3 = 7 ways.

Example:
- `count_ways(5, 3) == 12`

Implement `count_ways(N: int, K: int) -> int`.
