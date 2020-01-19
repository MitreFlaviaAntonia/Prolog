import math
from search import Problem

class FifteenPuzzle(Problem):

    def __init__(self, initial, goal):
        self.goal = goal
        self.initial = initial
        Problem.__init__(self, initial, goal)

    def blk_square(self, state):
        return state.index(0)

    def actions(self, state):
        possible_actions = ['LEFT', 'RIGHT', 'UP', 'DOWN']
        index_blk_square = self.blk_square(state)

        if index_blk_square % 4 == 3:
            possible_actions.remove('RIGHT')
        if index_blk_square % 4 == 0:
            possible_actions.remove('LEFT')
        if index_blk_square < 4:
            possible_actions.remove('UP')
        if index_blk_square > 11:
            possible_actions.remove('DOWN')
        return possible_actions

    def result(self, state, action):
        index_blk_square = self.blk_square(state)
        new_state = list(state)

        delta = { 'LEFT':-1, 'RIGHT':1, 'UP':-4, 'DOWN':4}
        neighbor = index_blk_square + delta[action]
        new_state[index_blk_square], new_state[neighbor] = new_state[neighbor], new_state[index_blk_square]

        return tuple(new_state)

    def goal(self, state):
        return state == self.goal

    def is_solvable(self, state):
        inv = 0
        for i in range(len(state)):
            for j in range(i, len(state)):
                if state[i] > state[j] != 0:
                    inv += 1

        return inv % 2 == 0

# Euclidian Method
    def h(self, node):
        return sum(math.sqrt(pow(s // 4 - g // 4,2) + pow(s % 4 - g % 4,2)) for (s,g) in zip(node.state, self.goal))
        
# Manhattan Method
    #def h(self, node):
        #return sum( abs( s // 4 - g // 4) + abs( s % 4 - g % 4) for (s,g) in zip(node.state, self.goal) )