# Create a Trie with dictionary
class TrieNode:
    def __init__(self, char):
        self.char = char
        self.children = {}
        self.isFullWord = False

class Trie:
    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.head = TrieNode("")
        
    # Time complexity: O(n), Space complexity: O(1)
    def insert(self, word: str) -> None:
        """
        Inserts a word into the trie.
        """
        cur = self.head
        for i, char in enumerate(word):
            if char not in cur.children:
                cur.children[char] = TrieNode(char)
            
            cur = cur.children[char]
            cur.pathHasWord = True

        cur.isFullWord = True
        cur.pathHasWord = True

    # Time complexity: O(n), Space complexity: O(1)
    def search(self, word: str) -> bool:
        """
        Returns if the word is in the trie.
        """
        cur = self.head
        for char in word:
            if char not in cur.children:
                return False
            cur = cur.children[char]
        
        return cur.isFullWord
        

    def startsWith(self, prefix: str) -> bool:
        """
        Returns if there is any word in the trie that starts with the given prefix.
        """
        cur = self.head
        for char in prefix:
            if char not in cur.children:
                return False
            cur = cur.children[char]

        return True


trie = Trie()
trie.insert("word")
print(trie.search("word"))
print(trie.startsWith("wo"))
print(trie.search("hi"))
print(trie.startsWith("h"))
