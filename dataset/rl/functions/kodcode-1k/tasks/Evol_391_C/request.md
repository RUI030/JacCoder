# sort_by_score

Sorts a list of names by their corresponding scores in descending order.
    In case of a tie, names are sorted alphabetically.

>>> sort_by_score([('Alice', 92), ('Bob', 95), ('Charlie', 95), ('Dave', 88)])
['Bob', 'Charlie', 'Alice', 'Dave']
>>> sort_by_score([('Alice', 100), ('Bob', 100), ('Charlie', 90)])
['Alice', 'Bob', 'Charlie']

Implement `sort_by_score(records: list[tuple[str, int]]) -> list[str]`.
