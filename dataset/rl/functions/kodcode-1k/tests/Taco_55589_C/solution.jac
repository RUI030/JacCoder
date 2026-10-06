"""
    Returns the name of the song with the highest play count. In case of a tie, returns the lexicographically
    smallest song name among those with the highest play count.

    Parameters:
    n (int): Number of songs.
    songs (list): List of tuples where each tuple contains a song name (str) and its play count (int).

    Returns:
    str: The name of the song with the highest play count or the lexicographically smallest song name in case of tie.
    """
def most_played_song(n: int, songs: list[tuple[str, int]]) -> str {
    import from collections { defaultdict }
    play_dict = defaultdict(int);
    for (song, count) in songs {
        play_dict[song] = count;
    }
    max_play_count = max(play_dict.values());
    max_played_songs = [
        song
        for (song, count) in play_dict.items()
        if (count == max_play_count)
    ];
    return min(max_played_songs);
}
with entry {
    n = 3;
    songs = [("songa", 30), ("songb", 30), ("songc", 10)];
    print(most_played_song(n, songs));
    n = 4;
    songs = [
        ("rockstar", 1000),
        ("popstar", 1000),
        ("metallica", 999),
        ("classical", 1001)
    ];
    print(most_played_song(n, songs));
}

