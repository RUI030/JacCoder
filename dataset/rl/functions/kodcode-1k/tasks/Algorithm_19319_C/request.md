# highlight_emails

Identifies all email addresses in the input text and surrounds them with square brackets.
>>> highlight_emails("Contact us at support@example.com for more details.") "Contact us at [support@example.com] for more details."
>>> highlight_emails("Send an email to admin@example.com or sales@example.co.uk.") "Send an email to [admin@example.com] or [sales@example.co.uk]."

Implement `highlight_emails(text: str) -> str`.
