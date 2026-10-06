# determine_treasure_locations

Determine if a queried point contains treasure or not.
Args:
    treasure_points: List of tuples representing treasure locations.
    query_points: List of tuples representing points to be queried.

Returns:
    List of strings "Treasure" or "Empty" for each queried point.

>>> determine_treasure_locations([(0, 0), (1, 1), (2, 2)], [(0, 0), (1, 0)])
["Treasure", "Empty"]
>>> determine_treasure_locations([(-1, -1), (2, 2)], [(2, 2), (3, 3), (-1, -1)])
["Treasure", "Empty", "Treasure"]

Implement `determine_treasure_locations(treasure_points: list[tuple[int, int]], query_points: list[tuple[int, int]]) -> list[str]`.
