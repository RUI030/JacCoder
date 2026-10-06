# is_valid_bank_account

You are working on a project that aims to ensure the safety of usage of bank account numbers. Your task is to check if the given bank account number is valid. A bank account number is considered valid if it meets the following criteria:
- It contains exactly 10 digits.
- It should not have any leading zeros.
- It should not contain any character other than digits.

Write a program which, given a string $A$ representing a bank account number, determines whether $A$ should be accepted or not.

-----Input-----
A single line of input which is the string $A$, representing the bank account number. The string consists of only digits 0–9 and may contain leading zeros or any other extraneous characters. The length of the string will not exceed $100$ characters.

-----Output-----
Print Valid if $A$ should be accepted according to the given rules, and Invalid otherwise.

-----Examples-----
Sample Input:
1234567890
Sample Output:
Valid

Sample Input:
12345678901
Sample Output:
Invalid

Sample Input:
0123456789
Sample Output:
Invalid

Sample Input:
12345a7890
Sample Output:
Invalid

Example:
- `is_valid_bank_account('1234567890') == 'Valid'`

Implement `is_valid_bank_account(account_str: str) -> str`.
