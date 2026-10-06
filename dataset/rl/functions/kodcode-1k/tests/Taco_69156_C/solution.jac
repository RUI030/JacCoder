def has_friend_never_receiving(n: int, friends: list[int]) -> str {
    receives_token = [0] * n;
    for friend in friends {
        receives_token[(friend - 1)] += 1;
    }
    for token_count in receives_token {
        if (token_count == 0) {
            return "YES";
        }
    }
    return "NO";
}

