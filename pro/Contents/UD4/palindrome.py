# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    to_check_text = text.lower().replace(" ", "")
    if to_check_text == to_check_text[::-1]:
        return True
    return False

