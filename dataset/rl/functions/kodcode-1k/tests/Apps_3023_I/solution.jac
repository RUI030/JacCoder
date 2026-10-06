"""
    Finds the area of the largest rectangle that can be formed within the bounds of the histogram.

    :param heights: List[int] - a list representing the heights of the bars in the histogram
    :return: int - the area of the largest rectangle
    """
def largestRectangleArea(heights: list[int]) -> int {
    stack = [];
    max_area = 0;
    heights.append(0);
    for i in range(len(heights)) {
        while (stack and (heights[stack[-1]] > heights[i])) {
            h = heights[stack.pop()];
            width = i if not stack else (i - stack[-1] - 1);
            max_area = max(max_area, (h * width));
        }
        stack.append(i);
    }
    return max_area;
}

