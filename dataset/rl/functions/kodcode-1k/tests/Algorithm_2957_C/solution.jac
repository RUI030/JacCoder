"""
    Adds two polynomials and returns the resulting polynomial in its simplified form.
    """
def add_polynomials(poly1: list[int], poly2: list[int]) -> list[int] {
    max_length = max(len(poly1), len(poly2));
    result = [0] * max_length;
    for i in range(max_length) {
        coeff1 = poly1[i] if (i < len(poly1)) else 0;
        coeff2 = poly2[i] if (i < len(poly2)) else 0;
        result[i] = coeff1 + coeff2;
    }
    while ((len(result) > 1) and (result[-1] == 0)) {
        result.pop();
    }
    return result;
}

