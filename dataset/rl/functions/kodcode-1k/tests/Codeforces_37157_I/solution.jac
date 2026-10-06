def max_balance(arr: list[int]) -> int {
    n = len(arr);
    max_balance = 0;
    for i in range(n) {
        even_count = 0;
        odd_count = 0;
        for j in range(i, n) {
            if ((arr[j] % 2) == 0) {
                even_count += 1;
            } else {
                odd_count += 1;
            }
            balance = abs((even_count - odd_count));
            if (balance > max_balance) {
                max_balance = balance;
            }
        }
    }
    return max_balance;
}

