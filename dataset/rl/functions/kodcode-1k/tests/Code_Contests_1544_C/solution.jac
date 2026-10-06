"""
    Computes the sum of all digit characters in the string and removes all digit characters from the string.
    Returns the modified string followed by the computed sum.
    """
def process_string(input_string: str) -> str {
    sum_of_digits = 0;
    modified_string = [];
    for char in input_string {
        if char.isdigit() {
            sum_of_digits += int(char);
        } else {
            modified_string.append(char);
        }
    }
    return (''.join(modified_string) + ' ' + str(sum_of_digits));
}

