import random
import numpy as np

def random_walk(n):
    x,y=0,0
    a=np.array([(0,1),(0,-1),(1,0),(-1,0)])
    for i in range(n):
        (dx,dy)=random.choice(a)
        x+=dx
        y+=dy
    return x,y

for i in range(10):
    walk = random_walk(500)
    print(walk)
