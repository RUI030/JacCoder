# max_photos

You are the CTO of a company that runs a popular cloud photo storage service. Your users frequently upload large batches of photos, and you need an efficient way to determine the maximum number of photos that can be stored given the current storage available on your cloud servers.

Your storage system has standardized its capacity such that each server can hold a maximum of `10^9` bytes (1 gigabyte). Each photo takes a variable amount of space. Given a list of photo sizes in bytes, write a function `max_photos(stored: List[int], capacity: int)` that determines the maximum number of photos that can be stored without exceeding the given capacity.

The function should take two arguments:
- `stored`: a list of integers representing the sizes of the photos already stored on the servers (in bytes).
- `capacity`: an integer representing the remaining available capacity (in bytes).

The function should return an integer representing the maximum number of additional photos (from those stored in the list) that can fit in the given capacity.

For example: If `stored = [200000000, 150000000, 300000000, 500000000]` and `capacity = 800000000`, the function `max_photos(stored, 800000000)` should return `3` because you can fit photos of sizes 200000000, 150000000, and 300000000 within the 800000000 bytes limit.

Example:
- `max_photos([200000000, 150000000, 300000000, 500000000], 800000000) == 3`

Implement `max_photos(stored: list[int], capacity: int) -> int`.
