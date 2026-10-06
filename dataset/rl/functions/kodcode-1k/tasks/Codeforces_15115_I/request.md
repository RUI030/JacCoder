# max_contiguous_empty_groups

Three students, Alice, Bob, and Charlie, are organizing a relay race for their friends. They have arranged a circular track with $$$n$$$ checkpoints numbered sequentially from $$$1$$$ to $$$n$$$. Each checkpoint has an invitation letter for the participating students. The students will pick up these letters one by one in a circular order, starting from checkpoint $$$1$$$, and leaving it empty once they pick up the letter.

Alice notices an interesting pattern and decides to pose a question: Assuming the students pick up the letters one by one in a sequential order, and after collecting a specific number $$$k$$$ of letters, what is the maximum number of contiguous groups of empty checkpoints that can be formed?

Since the original checkpoints were sequentially numbered and arranged in a circle, the problem can be challenging.

The only line of input contains two integers $$$n$$$ and $$$k$$$ ($$$1 \leq k \leq n \leq 1000$$$) — the total number of checkpoints and the number of checkpoints that have been picked up by the students respectively.

Print a single integer — the maximum number of contiguous groups of empty checkpoints that can be formed after picking up $$$k$$$ letters.

For example:

- In the first example, there are $$$7$$$ checkpoints, and $$$4$$$ letters have been picked up. Suppose the checkpoints picked are $$$1$$$, $$$3$$$, $$$5$$$, and $$$7$$$. The remaining checkpoints will create $$$4$$$ groups of empty checkpoints: $$$\{1\}$$$, $$$\{3\}$$$, $$$\{5\}$$$, and $$$\{7\}$$$, a maximum of $$$4$$$ groups.

- In the second example, there are $$$8$$$ checkpoints, and $$$5$$$ letters have been picked up. Suppose the checkpoints picked are $$$2$$$, $$$4$$$, $$$6$$$, $$$7$$$, and $$$8$$$. The remaining checkpoints will form a maximum of $$$3$$$ groups: $$$\{2,3\}$$$, $$$\{5,6\}$$$, and $$$\{8\}$$$.

Example:
- `max_contiguous_empty_groups(7, 4) == 4`

Implement `max_contiguous_empty_groups(n: int, k: int) -> int`.
