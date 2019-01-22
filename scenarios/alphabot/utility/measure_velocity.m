duty_cycle = 1;
ready_time = 200;
duration = 500; % unit : ms

writePWMDutyCycle(mypi, 13, duty_cycle);
writePWMFrequency(mypi, 13, 200);

java.lang.Thread.sleep(ready_time);

start_distance = get_distance(mypi);
java.lang.Thread.sleep(duration);
end_distance = get_distance(mypi);

velocity = (start_distance - end_distance) * 1000 / duration; % unit : cm / s
display(velocity)

run stop.m;

java.lang.Thread.sleep(500);

writePWMDutyCycle(mypi, 21, duty_cycle);
writePWMFrequency(mypi, 21, 200);
java.lang.Thread.sleep(ready_time + duration);
run stop.m;