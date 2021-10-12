import numpy as np
from matplotlib import pyplot as plt
import keyboard

mapa = [[1, 1, 1, 1, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 1, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 1, 1, 1, 1]]

for i in range(len(mapa)):
    for j in range(len(mapa)):
        if mapa[i][j] == 1:
            mapa[i][j] = list(np.random.uniform(0,1,3))
            # print("hi")
            
posx, posy, rot = 1.5, 1.5, np.pi/4
exitx, exity = 3, 3

while 1:
    
    plt.hlines(-0.6, 0, 60, colors='gray', lw=165, alpha=0.5)
    plt.hlines(0.6, 0, 60, colors='lightblue', lw=165)
    tilex, tiley, tilec = [], [], []
    for i in range(60):
        rot_i = rot + np.deg2rad(i-30)
        x, y = posx, posy
        sin, cos = 0.02*np.sin(rot_i), 0.02*np.cos(rot_i)
        n = 0
        
        while 1:
            xx, yy = (x, y)
            x, y, n = x + cos, y + sin, n +1

            # tiles logic
            if abs(int(3*xx)-int(3*x)) > 0 or abs(int(3*yy)-int(3*y))>0:
                tilex.append(i)
                tiley.append(-1/(0.02 * n))
                if int(x) == exitx and int(y) == exity:
                    tilec.append('b')
                else:
                    tilec.append('k')

            if mapa[int(x)][int(y)]:
                h = np.clip(1/(0.02 * n), 0, 1)
                c = np.asarray(mapa[int(x)][int(y)])*(0.3 + 0.7 * h)
                break
            
        plt.vlines(i, -h, h, lw=8, colors=c)
        
    plt.scatter(tilex, tiley, c=tilec, zorder=2) # draw tiles on the floor
    plt.axis('off'); plt.tight_layout(); plt.axis([0, 60, -1, 1])
    plt.draw(); plt.pause(0.0001); plt.clf()
    
    key = keyboard.read_key()
    x, y = (posx, posy)

    if key == 'up':
        x, y = (x + 0.3*np.cos(rot), y + 0.3*np.sin(rot))
    elif key == 'down':
        x, y = (x - 0.3*np.cos(rot), y - 0.3*np.sin(rot))
    elif key == 'left':
        rot = rot - np.pi/15
    elif key == 'right':
        rot = rot + np.pi/15
    elif key == 'esc':
        break

    if mapa[int(x)][int(y)] == 0:
        if int(posx) == exitx and int(posy) == exity:
            break
        posx, posy = (x, y)

plt.close()