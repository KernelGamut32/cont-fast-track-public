import arrow
from string_functions import get_vowel_count, get_letter_count

def main():
    phrase = input('Enter a text phrase: ')
    vowel_count = get_vowel_count(phrase)
    letter_count = get_letter_count(phrase)
    current_date = arrow.utcnow().format('YYYY-MM-DD')
    print('Current date is ', current_date)
    print('"{0:s}" contains {1:d} vowels'.format(phrase, vowel_count))
    print('"{0:s}" contains the following letter counts:'.format(phrase))
    for item in letter_count:
        print('{0:d} occurrence(s) of {1:s}'.format(letter_count[item], item))

main()
