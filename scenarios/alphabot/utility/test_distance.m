duty_cycle = 1;

writePWMDutyCycle(mypi, 13, duty_cycle);
writePWMFrequency(mypi, 13, 200);

distance = get_distance(mypi);
while distance > 30 
    java.lang.Thread.sleep(100);
    display(distance);
    distance = get_distance(mypi);
end

run stop.m;
java.lang.Thread.sleep(500);

writePWMDutyCycle(mypi, 21, duty_cycle);
writePWMFrequency(mypi, 21, 200);

distance = get_distance(mypi);
while distance < 120 
    java.lang.Thread.sleep(100);
    display(distance);
    distance = get_distance(mypi);
end

run stop.m;