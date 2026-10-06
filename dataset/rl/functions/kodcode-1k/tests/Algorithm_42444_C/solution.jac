"""
    Calculate the largest rectangular area in a histogram.

    :param heights: List of integers representing the heights of the histogram bars.
    :return: The area of the largest rectangle that can be formed within the histogram.
    """
def largest_rectangle_area(heights: list[int]) -> int {
    stack = [];
    max_area = 0;
    index = 0;
    while (index < len(heights)) {
        if (not stack or (heights[stack[-1]] <= heights[index])) {
            stack.append(index);
            index += 1;
        } else {
            top_of_stack = stack.pop();
            height = heights[top_of_stack];
            width = index if not stack else (index - stack[-1] - 1);
            max_area = max(max_area, (height * width));
        }
    }
    while stack {
        top_of_stack = stack.pop();
        height = heights[top_of_stack];
        width = index if not stack else (index - stack[-1] - 1);
        max_area = max(max_area, (height * width));
    }
    return max_area;
}

