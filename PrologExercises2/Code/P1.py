from search import Problem

class JugProblem(Problem):
    def result(self, state, action):
        return action

    def value(self, state):
        pass

    def __init__(self, initial, goal):
        self.goal = goal
        self.initial = initial
        self.visited_states = []
        Problem.__init__(self, self.initial, self.goal)

    def __repr__(self):
        return "< State (%s, %s) >" % (self.initial, self.goal)

    def goal(self, state):
        if (state[0]==2 or self.goal[0]==3):
            return True
        else:
            return False

    def actions(self, cur_state):
        actions = []

        self.visited_states.append(cur_state)

        #Pour water in the first Jug
        new_state = (4, cur_state[1])
        actions.append(new_state)

        #Pour water in the second Jug
        new_state = (cur_state[0], 3)
        actions.append(new_state)

        #Pour water from the first jug in the second jug
        if cur_state[0] + cur_state[1] <= 3:
            new_state = (0, cur_state[0] + cur_state[1])
        else:
            new_state = (0, 3)
        if cur_state[0] - (3 - cur_state[1]) >= 0:
            new_state = (cur_state[0] - (3 -cur_state[1]), new_state[1])
        else:
            new_state = (0,new_state[1])
        if cur_state[1] != 3:
            actions.append(new_state)

        #Pour water from the second jug in the first jug
        if cur_state[0] + cur_state[1] <= 4:
            new_state = (cur_state[0] + cur_state[1], 0)
        else:
            new_state = (4, 0)
        if cur_state[1] - (4 - cur_state[0]) >= 0:
            new_state = (new_state[0], cur_state[1] - (4 -cur_state[0]))
        else:
            new_state = (new_state[0], 0)
        if cur_state[0] != 4:
            actions.append(new_state)

        #Empty the first jug
        new_state = (0, cur_state[1])
        if cur_state[0] != 0:
            actions.append(new_state)

        #Empty the second jug
        new_state = (cur_state[0], 0)
        if cur_state[1] != 0:
            actions.append(new_state)

        return actions
