"""
    Find the difference between the sums of elements picked by Alice and Bob
    when both play optimally.
    """
def find_difference(arr: list[int]) -> int {
    arr.sort(reverse=True);
    (alice_sum, bob_sum) = (0, 0);
    for i in range(len(arr)) {
        if ((i % 2) == 0) {
            alice_sum += arr[i];
        } else {
            bob_sum += arr[i];
        }
    }
    return (alice_sum - bob_sum);
}

