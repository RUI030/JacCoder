"""
    Evaluates the polynomial with given coefficients at the value x.

    Arguments:
    coefficients -- List of coefficients (float), with coefficients[i] being the coefficient of x^(n-i)
    x -- The value at which the polynomial is to be evaluated (float)

    Returns:
    The value of the polynomial evaluated at x (float)
    """
def evaluate_polynomial(coefficients: list[float], x: float) -> float {
    n = len(coefficients);
    result = sum((coef * (x ** (n - i - 1))) for (i, coef) in enumerate(coefficients));
    return result;
}

