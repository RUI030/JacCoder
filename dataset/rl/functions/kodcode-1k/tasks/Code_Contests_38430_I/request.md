# generate_hashtags

You are a software developer tasked with creating a new feature for an online photo-sharing application. The feature will automatically generate hashtags for photos uploaded by users based on keywords extracted from the captions they provide. Your goal is to write a function that analyzes a given caption, identifies distinct keywords, and converts them into hashtags by prepending the '#' symbol and converting them to lowercase.

For this task, a keyword is defined as any contiguous sequence of alphabetic characters (a-z, A-Z). All other characters (such as numbers, punctuation, and spaces) are considered delimiters between words. The generated hashtags should be sorted in alphabetical order.

Input

A single string representing the caption (length ≤ 1000). The caption may contain any printable ASCII characters.

Output

A single string containing the generated hashtags separated by spaces, in alphabetical order.

Examples

Input


"This is my first photo!"


Output


#first #is #my #photo #this


Input


"Sunrise at the beach. #beautiful #morning"


Output


#at #beach #beautiful #morning #sunrise #the

Note

In the second example, hashtags already present in the caption should be included in the output and should follow the same rules for case conversion and sorting.

Example:
- `generate_hashtags('This is my first photo!') == '#first #is #my #photo #this'`

Implement `generate_hashtags(caption: str) -> str`.
