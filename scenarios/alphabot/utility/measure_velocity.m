% Initialization
duty_cycle = 0.5;
ready_time = 200;
duration = 1500; % unit : ms
run stop.m;

% temp = system(mypi, 'python photo_interrupter.py');

% Running forward
start_distance = get_distance(mypi);

writePWMDutyCycle(mypi, 13, duty_cycle);
writePWMFrequency(mypi, 13, 200);

java.lang.Thread.sleep(duration);

run stop.m;

end_distance = get_distance(mypi);

velocity_forward = (start_distance - end_distance) * 1000 / duration; % unit : cm / s
display(velocity_forward);

java.lang.Thread.sleep(500);

% Running backward
start_distance = get_distance(mypi);

writePWMDutyCycle(mypi, 21, duty_cycle);
writePWMFrequency(mypi, 21, 200);

java.lang.Thread.sleep(duration);

run stop.m;

end_distance = get_distance(mypi);

velocity_backward = (start_distance - end_distance) * 1000 / duration; % unit : cm / s
display(velocity_backward);

