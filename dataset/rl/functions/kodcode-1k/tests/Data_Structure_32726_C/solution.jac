"""
    Determines the total number of ways to decode an encoded message.
    """
def num_decodings(encoded_message: str) -> int {
    if (not encoded_message or (encoded_message[0] == '0')) {
        return 0;
    }
    n = len(encoded_message);
    dp = [0] * (n + 1);
    dp[0] = 1;
    dp[1] = 1;
    for i in range(2, (n + 1)) {
        one_digit = int(encoded_message[(i - 1)]);
        two_digits = int(encoded_message[(i - 2):i]);
        if (1 <= one_digit <= 9) {
            dp[i] += dp[(i - 1)];
        }
        if (10 <= two_digits <= 26) {
            dp[i] += dp[(i - 2)];
        }
    }
    return dp[n];
}

