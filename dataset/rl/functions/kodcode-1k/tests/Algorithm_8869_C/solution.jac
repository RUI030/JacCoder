import from typing { Any }
"""
    Sort a list of filenames primarily by file extension and secondarily by filename.
    The sort should be case-insensitive but maintain the original case in the output.
    """
def sort_files(file_list: list[str]) -> list[str] {
    return sorted(
        file_list, key=lambda (x: Any) { (x.split('.')[-1].lower(), x.lower()); }
    );
}

