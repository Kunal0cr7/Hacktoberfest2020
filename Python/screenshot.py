#!/usr/bin/python3
#Program Uploaded by Vivek Ray
import pyautogui
import time
i=0
while(i<60):
	time.sleep(30)
	i+=1
	screenshot = pyautogui.screenshot()
	screenshot.save("screenshot{}.png".format(i))
