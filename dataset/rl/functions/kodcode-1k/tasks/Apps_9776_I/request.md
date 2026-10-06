# can_rent_books

-----Problem Statement-----
A publishing company has launched a new e-book rental service. A customer can rent any number of books, but each book has a maximum duration for which it may be rented out. Once a book has been rented for that period, it is no longer available for rental until the customer returns it. Your task is to determine whether a particular customer's request to rent a set of books is valid, according to their respective maximum rental durations.

You are given the maximum rental duration for each book and a list of requested rental periods for each book the customer wants to rent. Determine whether or not the customer's request can be satisfied.

-----Input-----
- The first line contains an integer, $N$, the number of books in the system.
- The next line contains $N$ space-separated integers, $D_i$ ($1 \leq D_i \leq 10^9$), where $D_i$ represents the maximum rental duration for the $i$-th book.
- The third line contains an integer $M$, the number of books the customer wants to rent.
- The last line contains $M$ space-separated integers, $R_j$ ($1 \leq R_j \leq 10^9$), where $R_j$ represents the requested rental period for the $j$-th book.

-----Output-----
Output "YES" if the customer's request can be satisfied (i.e., each requested rental period does not exceed the corresponding book's maximum rental duration). Otherwise, output "NO".

-----Constraints-----
- $1 \leq N \leq 10^5$
- $1 \leq M \leq N$
- Each book is identified by its order in the list (first book, second book, etc.).

-----Sample Input-----
3
7 5 10
2
6 4

-----Sample Output-----
YES

-----EXPLANATION-----
The customer wants to rent 2 books. The first requested period is 6, which is less than the maximum rental duration for that book (7). The second requested period is 4, which is also less than the maximum rental duration for that book (5). Both requests are valid; hence the output is "YES".

Example:
- `can_rent_books([7, 5, 10], [6, 4]) == 'YES'`

Implement `can_rent_books(max_durations: list[int], requested_rentals: list[int]) -> str`.
