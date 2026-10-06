# max_requests_processed

Given the number of incoming requests per time unit n and the total time units t,
this function returns the maximum number of requests that can be processed.

>>> max_requests_processed(3, 5)
5
>>> max_requests_processed(1, 10)
10

Implement `max_requests_processed(n: int, t: int) -> int`.
