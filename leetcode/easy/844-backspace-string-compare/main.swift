/*
 844. Backspace String Compare
 
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.
 
 Time complexity: O(s + t)
 Space complexity: O(s + t)
 */
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        // #b#c.     #b#c
        //
        
        return removeBackspace(S) == removeBackspace(T)
    }
    
    private func removeBackspace(_ S: String) -> String {
        var stack = [Character]()
        for s in S {
            if s == "#" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(s)
            }
        }
        return stack.map{String($0)}.joined()
    }
}
