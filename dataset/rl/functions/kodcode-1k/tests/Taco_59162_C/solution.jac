def can_reach_target_sum(arr: list[int], target: int) -> str {
    n = len(arr);
    dp = [False] * (target + 1);
    dp[0] = True;
    for num in arr {
        for j in range(target, (num - 1), -1) {
            if dp[(j - num)] {
                dp[j] = True;
            }
        }
    }
    return "YES" if dp[target] else "NO";
}

