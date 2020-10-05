/*
 71. Simplify Path
 
 Given an absolute path for a file (Unix-style), simplify it. Or in other words, convert it to the canonical path.

 In a UNIX-style file system, a period . refers to the current directory. Furthermore, a double period .. moves the directory up a level.

 Note that the returned canonical path must always begin with a slash /, and there must be only a single slash / between two directory names. The last directory name (if it exists) must not end with a trailing /. Also, the canonical path must be the shortest string representing the absolute path.
 */
class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [String]()
        
        // /a/b/c/..////./
        // a b c .. .
        var directories = path.split(separator: "/")
      
        for directory in directories {
            switch directory {
                case ".":
                    continue
                case "..":
                    if stack.count > 0 {
                        stack.removeLast()
                    }
                default:
                    stack.append(String(directory))
            }
        }
        
        return "/" + stack.joined(separator: "/")
    }
}
