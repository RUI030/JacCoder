import re;
import from typing { List }
def transform_emails(email_list: list[str]) -> list[str] {
    email_pattern = re.compile(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]+$');
    transformed_emails = [];
    for email in email_list {
        if email_pattern.match(email) {
            local_part = email.split('@')[0];
            transformed_emails.append(f'{local_part}@company.com');
        }
    }
    return transformed_emails;
}

