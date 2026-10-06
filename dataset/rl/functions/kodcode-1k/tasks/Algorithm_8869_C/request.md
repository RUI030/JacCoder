# sort_files

Sort a list of filenames primarily by file extension and secondarily by filename. 
The sort should be case-insensitive but maintain the original case in the output.

Args:
    file_list (list): List of filenames to sort.

Returns:
    list: Sorted list of filenames.

Example:
>>> sort_files(["file.txt", "file.TXT", "analyzer.EXE", "data.csv", "Report.docx"])
["data.csv", "Report.docx", "analyzer.EXE", "file.txt", "file.TXT"]
>>> sort_files(["image.jpeg", "File.TXT", "image.PNG"])
["image.jpeg", "image.PNG", "File.TXT"]

Implement `sort_files(file_list: list[str]) -> list[str]`.
