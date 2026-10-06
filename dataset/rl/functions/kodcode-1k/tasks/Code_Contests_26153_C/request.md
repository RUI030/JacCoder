# toll_booth

Implement an automated toll system. 
Vehicles pass through a toll gate, and each vehicle can either have an electronic pass or pay in cash. 
The toll rate is $5 for vehicles with an electronic pass and $10 for those paying in cash. 
The toll booth initially has no money.

Args:
n (int): number of vehicles passing through the toll gate
vehicles (List[int]): type of payment each vehicle is making, where 1 denotes an electronic pass and 2 denotes paying in cash

Returns:
str: "SUCCESS" if the toll booth can process each vehicle correctly, otherwise "FAIL"

Examples:
>>> toll_booth(5, [2, 1, 2, 2, 1])
'FAIL'
>>> toll_booth(6, [1, 2, 1, 1, 2, 2])
'SUCCESS'

Implement `toll_booth(n: int, vehicles: list[int]) -> str`.
