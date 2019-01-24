function velocity = get_velocity(mypi, time_interval)
    command = ['python photo_interrupter.py ' num2str(time_interval)];
    average_time_string = system(mypi, command);
    average_time_string = strip(average_time_string);
    average_time = str2double(average_time_string);
    velocity = 1.15 / average_time; % unit : cm / s
end

% duty_cycle = 1 : 270.0800 / 234.0735 = 1.1538256146
% duty_cycle = 0.8 : 221.8720 / 193.1738 = 1.14856155441
% duty_cycle = 0.5 : 143.0230 / 124.5883 = 1.14796493732
% 1.15011736878