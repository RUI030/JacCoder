# mask_credit_card_number

Masks all but the last four characters of any sequence of digits
that is exactly 16 digits long in the input string.

>>> mask_credit_card_number("My credit card number is 1234567812345678.")
'My credit card number is ************5678.'
>>> mask_credit_card_number("1234567812345678")
'************5678'

Implement `mask_credit_card_number(s: str) -> str`.
