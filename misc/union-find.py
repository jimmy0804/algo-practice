
class Graph:
    def __init__(self, vertices):
        self.vertices = vertices
        self.graph = {}
    
    def addEdge(self, v1, v2):
        if v1 in self.graph:
            self.graph[v1].append(v2)
        else:
            self.graph[v1] = [v2]
    
    def find(self, parent, v1):
        if parent[v1] == -1:
            return v1
        else:
            return self.find(parent, parent[v1])

    def union(self, parent, v1, v2):
        x = self.find(parent, v1)
        y = self.find(parent, v2)
        parent[x] = y
    
    def detectCycle(self):
        parent = [-1] * self.vertices

        for i in self.graph:
            for j in self.graph[i]:
                v1 = self.find(parent, i)
                v2 = self.find(parent, j)
                if v1 == v2:
                    return True
                
                self.union(parent, v1, v2)

        return False


graph = Graph(4)
graph.addEdge(0, 1)
graph.addEdge(1, 2)
graph.addEdge(3, 2)
graph.addEdge(3, 0)

print(graph.detectCycle())
