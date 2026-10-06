"""
    Returns the starting index of the first occurrence of the flag sequence in the packet.
    If the sequence is not found, returns -1.
    """
def find_flag_sequence(packet: str, flags: str) -> int {
    packet_len = len(packet);
    flags_len = len(flags);
    if (packet_len < flags_len) {
        return -1;
    }
    for i in range(((packet_len - flags_len) + 1)) {
        if (packet[i:(i + flags_len)] == flags) {
            return i;
        }
    }
    return -1;
}

