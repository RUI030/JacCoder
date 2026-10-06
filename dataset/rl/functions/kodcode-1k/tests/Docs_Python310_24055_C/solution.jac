import from typing { List }
def process_strings(strings: list[str], new_length: int) -> str {
    bytearrays = [bytearray(s, 'utf-8') for s in strings];
    concatenated = bytearray().join(bytearrays);
    concatenated = concatenated[:new_length].ljust(new_length, b'\x00');
    return concatenated.decode('utf-8');
}

