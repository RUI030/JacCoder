# transform_emails

Validate and transform a list of email addresses using regular expressions. 
Valid addresses will have their domains replaced with 'company.com'.

- Contain an alphanumeric username (can include periods, hyphens, and underscores).
- Have an "@" symbol separating the username and the domain.
- Have a domain name that consists of alphabets and possibly periods (e.g., "example.com", "sub.example.com").

Args:
    email_list: A list of strings, where each string is an email address.

Returns:
    List[str]: A list of transformed email addresses that are valid.

>>> transform_emails(["john.doe@example.com", "jane-doe@example.net", "invalid@address", "alice@sub.example.com"])
["john.doe@company.com", "jane-doe@company.com", "alice@company.com"]
>>> transform_emails(["invalid@address", "invalid"])
[]

Implement `transform_emails(email_list: list[str]) -> list[str]`.
