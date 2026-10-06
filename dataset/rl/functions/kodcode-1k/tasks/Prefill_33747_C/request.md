# remove_text_between_delimiters

Removes the text between the specified start and end delimiters, including the delimiters themselves.
>>> remove_text_between_delimiters("Hello [world] everyone", "[", "]")
'Hello  everyone'
>>> remove_text_between_delimiters("Hello <world> everyone", "<", ">")
'Hello  everyone'

Implement `remove_text_between_delimiters(text: str, start_delim: str, end_delim: str) -> str`.
