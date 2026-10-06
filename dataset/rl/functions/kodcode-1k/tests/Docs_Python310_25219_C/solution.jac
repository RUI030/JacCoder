def convert_string(input_string: str, encoding: str) -> str {
    try {
        encoded_bytes = input_string.encode(encoding);
        decoded_string = encoded_bytes.decode(encoding);
        return decoded_string;
    } except (UnicodeEncodeError, UnicodeDecodeError) {
        return "Error: Encoding/Decoding failed";
    }
}

