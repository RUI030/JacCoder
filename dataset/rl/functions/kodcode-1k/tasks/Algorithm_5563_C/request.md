# evaluate_polynomial

Evaluates the polynomial with given coefficients at the value x.

Arguments:
coefficients -- List of coefficients (float), with coefficients[i] being the coefficient of x^(n-i)
x -- The value at which the polynomial is to be evaluated (float)

Returns:
The value of the polynomial evaluated at x (float)

Examples:
>>> evaluate_polynomial([3, 2, 1], 2)
17

>>> evaluate_polynomial([4, -1, 2, 1], 1)
6

Implement `evaluate_polynomial(coefficients: list[float], x: float) -> float`.
