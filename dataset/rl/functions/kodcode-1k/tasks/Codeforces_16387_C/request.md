# canArrangeBalloons

Determine if it is possible to arrange the balloons such that no two consecutive balloons have the same color at any segment position.

:param n: Number of balloons
:param balloons: List of balloon color segment strings
:return: "YES" if arrangement possible, "NO" otherwise

>>> canArrangeBalloons(3, ["RGB", "BRG", "GBR"])
"YES"
>>> canArrangeBalloons(2, ["RGB", "RGB"])
"NO"

Implement `canArrangeBalloons(n: int, balloons: list[str]) -> str`.
