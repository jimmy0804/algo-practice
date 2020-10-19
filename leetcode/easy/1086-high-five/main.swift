/**
 1086. High Five
 
 Given a list of scores of different students, return the average score of each student's top five scores in the order of each student's id.

 Each entry items[i] has items[i][0] the student's id, and items[i][1] the student's score.  The average score is calculated using integer division.
 
 Time complexity: O(k * nlogn) where n is the max of total number of scores for each student, k is the total number of students
 Space complexity: O(k * n )
 */
class Solution {
    func highFive(_ items: [[Int]]) -> [[Int]] {
        var map = [Int: [Int]]()
        
        for item in items {
            let studentId = item[0]
            let score = item[1]
            
            map[studentId, default: [Int]()].append(score)
        }
        
        var result = [[Int]]()
        for (key, value) in map {
            let topFiveScores = value.sorted().suffix(5)
            let average = topFiveScores.reduce(0, +) / 5
            
            result.append([key, average])
        }
        
        return result.sorted { $0[0] < $1[0] }
    }
}
