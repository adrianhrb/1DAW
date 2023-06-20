# ********
# PANGRAMA
# ********


def is_pangram(text: str) -> bool:
    mod_text = text.lower().replace(" ", "")
    alphabet = list("abcdefghijklmnopqrstuvwxyz")
    to_analize_text = []
    for char in mod_text:
        if char not in to_analize_text:
            to_analize_text.append(char)
    if sorted(to_analize_text) == alphabet:
        return True
    return False