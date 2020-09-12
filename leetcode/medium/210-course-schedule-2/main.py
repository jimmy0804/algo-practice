"""
    210. Course Schedule II

    There are a total of n courses you have to take labelled from 0 to n - 1.

    Some courses may have prerequisites, for example, if prerequisites[i] = [ai, bi] this means you must take the course bi before the course ai.

    Given the total number of courses numCourses and a list of the prerequisite pairs, return the ordering of courses you should take to finish all courses.

    If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.
    
    Time complexity: O(V + E)
    Space complexity: O(V + E)
"""
class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        adjList = self.makeAdjList(numCourses, prerequisites)
        
        result = []
        visited = set()
        visiting = set()
        self.foundCycle = False

        for v, edges in adjList.items():
            if v not in visited:
                self.dfs(v, adjList, visited, visiting, result)

        if self.foundCycle:
            return []

        return stack

    def makeAdjList(self, numCourses, prerequisites):
        adjList = {}
        
        for course in range(numCourses):
            adjList[course] = []
        
        for pre in prerequisites:
            course, preCourse = pre[0], pre[1]
            adjList[course].append(preCourse)
        
        return adjList

    def dfs(self, v, adjList, visited, visiting, result):
        if v in visiting:
            self.foundCycle = True
            return

        visiting.add(v)
        
        for edge in adjList[v]:
            if edge not in visited:
                self.dfs(edge, adjList, visited, visiting, result)

        visited.add(v)
        visiting.remove(v)
        result.append(v)
