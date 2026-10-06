def decode_python_version(hexversion: int) -> str {
    major = (hexversion >> 24) & 255;
    minor = (hexversion >> 16) & 255;
    micro = (hexversion >> 8) & 255;
    release_level = (hexversion >> 4) & 15;
    release_serial = hexversion & 15;
    release_level_map = {10: 'a', 11: 'b', 12: 'rc', 15: ''};
    release_level_str = release_level_map[release_level];
    version = f"{major}.{minor}.{micro}{release_level_str}{release_serial
        if release_level_str
        else ''}";
    return version;
}

