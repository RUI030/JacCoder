# validate_password

You are building a basic authentication system for a web application. Part of this system requires validating user passwords according to specific rules.

Write a function named `validate_password` that performs the following:

1. Accepts a single string input which is the password to be validated.
2. Ensure the password meets the following criteria:
   - At least 8 characters long.
   - Contains at least one uppercase letter.
   - Contains at least one lowercase letter.
   - Contains at least one numerical digit.
   - Contains at least one special character from the set `!@#$%^&*()-_=+`.

3. If the password meets all the criteria, return the string "Password is valid".
4. If it fails to meet any of the criteria, return the string "Password is invalid".

**Requirements:**
- You must handle the string manipulations and checks without using any external libraries.
- Ensure that the function accurately evaluates each of the password criteria distinctly.

Example:
- `validate_password('Valid1@password') == 'Password is valid'`

Implement `validate_password(password: str) -> str`.
