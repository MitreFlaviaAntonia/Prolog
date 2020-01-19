from search import *
from P1 import JugProblem
from P2 import FifteenPuzzle

def main():
    print("\nFirst problem:\n")
    problem1 = JugProblem((0, 0), (2, 3))
    path1 = breadth_first_graph_search(problem1).solution()
    print(path1)

    print("\nSecond problem:\n")
    problem2 = FifteenPuzzle((1, 6, 2, 3, 5, 0, 7, 4, 9, 10, 12, 8, 13, 14, 11, 15), (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0))
    path2 = astar_search(problem2).solution()
    print(path2, '\n')


if __name__ == "__main__":
    main()
