# summarize_list_elements

Create a function in Python that takes a list of integers and returns a dictionary summarizing the list's elements. The keys of the dictionary should include 'positive', 'negative', 'zero', 'even', 'odd', and 'sum', representing the count of positive numbers, negative numbers, zeroes, even numbers, odd numbers, and the sum of all numbers in the list, respectively. For example, the input list [1, -1, 0, 2, 3] should return {'positive': 3, 'negative': 1, 'zero': 1, 'even': 2, 'odd': 3, 'sum': 5}.

Example:
- `summarize_list_elements([1, 2, 3, 4, 5]) == {'positive': 5, 'negative': 0, 'zero': 0, 'even': 2, 'odd': 3, 'sum': 15}`

Implement `summarize_list_elements(lst: list[int]) -> dict[str, int]`.
