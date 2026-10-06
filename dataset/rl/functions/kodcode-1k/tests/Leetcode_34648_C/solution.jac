"""
    Finds the next greater element for each element in nums2 within nums1.
    """
def next_greater_element(nums1: list[int], nums2: list[int]) -> list[int] {
    result = [];
    num_dict = {val: idx for (idx, val) in enumerate(nums1)};
    for num in nums2 {
        found = False;
        for i in range((num_dict[num] + 1), len(nums1)) {
            if (nums1[i] > num) {
                result.append(nums1[i]);
                found = True;
                break;
            }
        }
        if not found {
            result.append(-1);
        }
    }
    return result;
}

