# most_frequent_extension

A company has a large collection of important documents stored in various folders and subfolders. 
Write a function to find the most frequently used file extension based on file extensions.

If there are multiple file extensions with the same usage frequency, return the lexicographically smallest one.

Parameters:
n (int): Number of files in the system.
files (List[str]): List of file paths.

Returns:
str: The most frequently used file extension.

Example:
>>> most_frequent_extension(7, [
    "docs/report.pdf",
    "imgs/photo.jpg",
    "docs/notes.txt",
    "archive.tar.gz",
    "scripts/run.sh",
    "logs/",
    "docs/draft.pdf"
])
"pdf"

>>> most_frequent_extension(6, [
    "docs/report.pdf",
    "imgs/photo.jpg",
    "docs/notes.txt",
    "docs/another.pdf",
    "imgs/another.jpg",
    "docs/another.txt",
])
"jpg"

Implement `most_frequent_extension(n: int, files: list[str]) -> str`.
