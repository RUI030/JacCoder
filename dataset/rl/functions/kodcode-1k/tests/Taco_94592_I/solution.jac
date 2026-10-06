def smallestNonRepresentableSum(N: int, V: list[int]) -> int {
    V.sort();
    smallest_sum = 1;
    for coin in V {
        if (coin > smallest_sum) {
            break;
        }
        smallest_sum += coin;
    }
    return smallest_sum;
}

