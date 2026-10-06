# bouncer_count

Write a function named `bouncer_count` that takes in a list of tuples representing people trying to enter a club. 
Each tuple contains a name (string) and an age (integer). The function should return an integer representing the number 
of people denied entry based on the following rules:

1. Only people aged 21 or older are allowed entry.
2. If a person has the same name as someone already inside, they are denied entry regardless of age.
3. Nicknames are defined as strings that can match the first 3 letters of another name. For instance, "Alex" and 
   "Alexander" are considered the same person. 

The function should be case-insensitive when comparing names and nicknames.

Note: You may assume that names have at least 3 characters.

Test cases:
>>> bouncer_count([("Alex", 22), ("Bob", 25), ("Alice", 23)]) == 0
>>> bouncer_count([("Alex", 20), ("Bob", 18), ("Alice", 19)]) == 3

Implement `bouncer_count(people: list[tuple[str, int]]) -> int`.
