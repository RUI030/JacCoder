# garden_plots

Determines the side length of the largest possible square plot and the total number
of such square plots that can fit in the rectangular plot with length L and width W.

Args:
L (float): The length of the rectangular plot.
W (float): The width of the rectangular plot.

Returns:
tuple: A tuple containing the side length of the largest square plot (in meters) 
       and the total number of such square plots.

>>> garden_plots(10, 15)
(5, 6)
>>> garden_plots(7, 13)
(1, 91)

Implement `garden_plots(L: float, W: float) -> tuple[int, int]`.
