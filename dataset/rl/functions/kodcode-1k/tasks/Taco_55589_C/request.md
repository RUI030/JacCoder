# most_played_song

Returns the name of the song with the highest play count. In case of a tie, returns the lexicographically
smallest song name among those with the highest play count.

Parameters:
n (int): Number of songs.
songs (list): List of tuples where each tuple contains a song name (str) and its play count (int).

Returns:
str: The name of the song with the highest play count or the lexicographically smallest song name in case of tie.

Example:
- `most_played_song(1, [('singlesong', 1)]) == 'singlesong'`

Implement `most_played_song(n: int, songs: list[tuple[str, int]]) -> str`.
