def is_vowel(letter):
    if letter in 'aeiouAEIOU':
        return True
    else:
        return False

def get_vowel_count(phrase):
    count = 0
    for ch in phrase.lower():
        if (is_vowel(ch)):
            count += 1
    return count

def get_letter_count(phrase):
    letter_counts = {}
    for ch in phrase.lower():
        if ch.isalpha():
            if letter_counts.get(ch) == None:
                letter_counts[ch] = 0
            letter_counts[ch] += 1
    return letter_counts
