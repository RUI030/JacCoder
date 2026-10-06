# calculate_net_salaries

Given a list of gross salaries, calculate the net salaries after tax deduction.
The tax rates are:
- For salaries up to 50,000, the tax rate is 10%.
- For salaries between 50,001 and 100,000, the tax rate is 20%.
- For salaries above 100,000, the tax rate is 30%.

Args:
gross_salaries (list of int): List containing gross salaries of employees.

Returns:
list of int: List containing net salaries of employees after tax deduction.

>>> calculate_net_salaries([40000, 60000, 120000, 70000, 50000])
[36000, 48000, 84000, 56000, 45000]
>>> calculate_net_salaries([30000])
[27000]

Implement `calculate_net_salaries(gross_salaries: list[int]) -> list[int]`.
