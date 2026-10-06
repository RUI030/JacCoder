# min_distance

You are given two strings, `s1` and `s2`, and you need to transform `s1` into `s2` using the minimum number of operations. The permitted operations are:

1. Insert a character.
2. Remove a character.
3. Replace a character.

Design an algorithm to find the minimum number of operations required to transform `s1` into `s2`.

Example:

Input: s1 = "horse", s2 = "ros"
Output: 3
Explanation: 
- Remove 'h' from "horse" => "orse"
- Replace 'o' with 'r' => "rrse"
- Remove 'e' from "rrse" => "ros"

Input: s1 = "intention", s2 = "execution"
Output: 5
Explanation: 
- Replace 'i' with 'e' => "entention"
- Replace 'n' with 'x' => "extention"
- Replace 't' with 'e' => "exention"
- Insert 'c' after 'e' => "execention"
- Replace 'n' with 'u' => "execution"

Example:
- `min_distance('horse', 'ros') == 3`

Implement `min_distance(s1: str, s2: str) -> int`.
