import RPi.GPIO as GPIO
import time
import sys

CNTL = 7
CNTR = 8

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(CNTL, GPIO.IN)
GPIO.setup(CNTR, GPIO.IN)

time_interval = float(sys.argv[1])

start_time = time.time()
start_time_L, end_time_L, start_time_R, end_time_R = None, None, None, None
previous_L, previous_R = None, None
count_L, count_R = 0, 0

timeout = False
while not timeout :
    L = GPIO.input(CNTL)
    R = GPIO.input(CNTR)
    current_time = time.time()

    if current_time - start_time > time_interval :
        timeout = True

    if L == 0 and previous_L == 1 :
        if start_time_L == None :
            start_time_L = current_time
        else :
            end_time_L = current_time
            count_L = count_L + 1
    
    if R == 0 and previous_R == 1 :
        if start_time_R == None :
            start_time_R = current_time
        else :
            end_time_R = current_time
            count_R = count_R + 1

    previous_L = L
    previous_R = R
    time.sleep(0.00001)

average_time_L = (end_time_L - start_time_L) / count_L
average_time_R = (end_time_R - start_time_R) / count_R
average_time = (average_time_L + average_time_R) / 2.0

print "%.8f" % average_time
