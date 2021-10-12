import pyautogui
import keyboard
import random

start = "w"
while ( start == "w" ):
    start = input()

middleX, middleY = pyautogui.position()

arrayX = [middleX-200,middleX+200, middleX, middleX+200, middleX-200]
arrayY = [middleY+200,middleY+200, middleY, middleY-200, middleY-200]
 
def loop():
    Location = random.randint(0, 4)

    if ( arrayX[Location] == middleX or arrayY[Location] == middleY ) and arrayX[Location] != arrayY[Location]:
        loop()
    else:
        keyboard.press("Q")
        pyautogui.click(arrayX[Location], arrayY[Location])

loop()