from enchant.tokenize import Filter
from enchant.tokenize import unit_tokenize
import enchant
import sphinx_aimms_theme
import os
import pdb

class ProperNounsFilter(Filter):
    """If a word looks like a proper nouns (first letter is a capital letter),
    ignore it.
    """
    def _skip(self, word):

        return (word[0].isupper() # first letter caps
                 and
                 not word[1:].isupper()
                 )

class PrefixedWordsFilter(Filter):

    """If a word is prefixed, split it and spellcheck only the word without prefix.
    """
    prefixes = ['non','pre','post','de','sub','sup','re','un']

    def _split(self, word):
        
        d = enchant.DictWithPWL("en_US",os.path.join(os.path.dirname(sphinx_aimms_theme.__file__),"spelling_wordlist.txt"))
        
        # Check word without prefix if word not in enchant dictionnary
        for prefix in self.prefixes:
          if word.startswith(prefix) and not d.check(word):
              
              return unit_tokenize(word[len(prefix):])

        return unit_tokenize(word)
