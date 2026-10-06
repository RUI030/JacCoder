# modular_exponential

Returns the result of (base^exponent) % mod using iterative Fast Exponentiation.

Parameters:
base (int): The base integer. 1 <= base <= 10^9.
exponent (int): The exponent integer. 0 <= exponent <= 10^9.
mod (int): The modulus integer. 1 <= mod <= 10^9.

Returns:
int: Result of (base^exponent) % mod.

Examples:
>>> modular_exponential(2, 10, 1000) == 24
>>> modular_exponential(3, 7, 13) == 3

Implement `modular_exponential(base: int, exponent: int, mod: int) -> int`.
