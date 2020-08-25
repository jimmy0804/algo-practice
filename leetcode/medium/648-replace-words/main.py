# 648. Replace Words

# In English, we have a concept called root, which can be followed by some other words to form another longer word - let's call this word successor. For example, when the root "an" is followed by the successor word "other", we can form a new word "another".

# Given a dictionary consisting of many roots and a sentence consisting of words spearted by spaces. You need to replace all the successors in the sentence with the root forming it. If a successor can be replaced by more than one root, replace it with the root with the shortest length.

# Return the sentence after the replacement.

class TrieNode:
    def __init__(self, letter):
        self.letter = letter
        self.isFullWord = False
        self.children = {}
        
class Trie:
    def __init__(self):
        self.root = TrieNode("")
        
    def insert(self, word) -> None:
        cur = self.root
        for letter in word:
            if letter not in cur.children:
                cur.children[letter] = TrieNode(letter)
            
            cur = cur.children[letter]
        
        cur.isFullWord = True
    
    def findSuccessor(self, word) -> str:
        cur = self.root
        i = 0
        for letter in word:
            # No prefix found
            if letter not in cur.children:
                return word
            
            # As soon as we see a matching prefix, return immediately because
            # we need to find root with the shortest length
            if cur.children[letter].isFullWord:
                return word[0:i + 1]
            
            i += 1
            cur = cur.children[letter]
        
        return word
    
class Solution:
    def replaceWords(self, dictionary: List[str], sentence: str) -> str:
        trie = Trie()
        # Time complexity: O(m * n) where m is num of roots, n is max root length
        for item in dictionary:
            trie.insert(item)
        
        result = []
        
        # Time complexity: o(n * s) where n is the max length of root, s is number of words in sentence
        for word in sentence.split():
            result.append(trie.findSuccessor(word))
        
        return " ".join(result)
        
        
        
        
