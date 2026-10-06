# verify_captcha

Verifies if the entered captcha matches the generated captcha.
>>> verify_captcha("aB3kL", "aB3kL") == True
>>> verify_captcha("XyZ12", "xyz12") == False

Implement `verify_captcha(generated_captcha: str, entered_captcha: str) -> bool`.
