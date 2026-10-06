# find_flag_sequence

Returns the starting index of the first occurrence of the flag sequence in the packet.
If the sequence is not found, returns -1.

>>> find_flag_sequence("a1b2c3d4e5f6", "c3d")
4

>>> find_flag_sequence("a1b2c3d4e5f6", "d5f")
-1

Implement `find_flag_sequence(packet: str, flags: str) -> int`.
