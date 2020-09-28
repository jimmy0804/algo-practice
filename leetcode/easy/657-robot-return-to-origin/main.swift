/**
 657. Robot Return to Origin
 
 There is a robot starting at position (0, 0), the origin, on a 2D plane. Given a sequence of its moves, judge if this robot ends up at (0, 0) after it completes its moves.

 The move sequence is represented by a string, and the character moves[i] represents its ith move. Valid moves are R (right), L (left), U (up), and D (down). If the robot returns to the origin after it finishes all of its moves, return true. Otherwise, return false.

 Note: The way that the robot is "facing" is irrelevant. "R" will always make the robot move to the right once, "L" will always make it move left, etc. Also, assume that the magnitude of the robot's movement is the same for each move.
 
 Time complexity: O(n)
 Space complexity: O(1)
 */

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        // R(0,1) L(0,-1) U(-1,0) D(1,0)
        // U D
        // current = (0,0) -> (-1, 0) -> (0, 0)
        
        var current = [0, 0]
        for move in moves {
            switch String(move) {
                case "R":
                    current[1] += 1
                case "L":
                    current[1] -= 1
                case "U":
                    current[0] -= 1
                case "D":
                    current[0] += 1
                default:
                    break
            }
        }
        
        return current[0] == 0 && current[1] == 0
    }
}
