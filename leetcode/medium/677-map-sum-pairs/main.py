# 677. Map Sum Pairs

# Implement a MapSum class with insert, and sum methods.

# For the method insert, you'll be given a pair of (string, integer). The string represents the key and the integer represents the value. If the key already existed, then the original key-value pair will be overridden to the new one.

# For the method sum, you'll be given a string representing the prefix, and you need to return the sum of all the pairs' value whose key starts with the prefix.
class TrieNode:
    def __init__(self, letter, sum):
        self.letter = letter
        self.sum = sum
        self.children = {}

class MapSum:

    # Space complexity: O(word * letter)
    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.root = TrieNode("", 0)
        self.keyList = {}
        
    # Time complexity: O(n), Space complexity: O(1)
    def insert(self, key: str, val: int) -> None:
        different = val
        if key in self.keyList:
            different = val - self.keyList[key]
        
        self.keyList[key] = val
    
        node = self.root
        
        for letter in key:
            if letter not in node.children:
                node.children[letter] = TrieNode(letter, val)
            else:
                node.children[letter].sum += different
    
            node = node.children[letter]

        # Time complexity: O(n), Space complexity: O(1)
    def sum(self, prefix: str) -> int:
        node = self.root
        for letter in prefix:
            if letter not in node.children:
                return 0
            node = node.children[letter]
        
        return node.sum
