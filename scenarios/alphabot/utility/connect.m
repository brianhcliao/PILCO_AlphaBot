% Connect to Raspberry Pi board
try
    disp('Connecting to Arthur...');
    mypi = raspi('192.168.10.108', 'pi', 'arthur');
    disp('"mypi" assigned to Arthur');
catch ME
    disp(getReport(ME, 'extended', 'hyperlinks', 'on'));
    try
        disp('Connecting to Davis...');
        mypi = raspi('192.168.10.109','pi','davis');
        disp('"mypi" assigned to Davis');
    catch ME
        disp(getReport(ME, 'extended', 'hyperlinks', 'on'));
    end
end

% Pin configuration and motor enabling
configurePin(mypi, 13, 'PWM');
configurePin(mypi, 20, 'PWM');
configurePin(mypi, 12, 'PWM');
configurePin(mypi, 21, 'PWM');
configurePin(mypi, 6, 'DigitalOutput');
configurePin(mypi, 26, 'DigitalOutput');
writeDigitalPin(mypi, 6, 1);
writeDigitalPin(mypi, 26, 1);


% 13, 21

% disableSPI(mypi);

%{
    mypi = 
        raspi with properties:
            DeviceAddress: 10.16.2.153                   
            Port: 18734                         
            BoardName: Raspberry Pi Model B+         
            AvailableLEDs: {'led0'}                      
            AvailableDigitalPins: [4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]
            AvailableSPIChannels: {'CE0','CE1'}                 
            AvailableI2CBuses: {'i2c-1'}                     
            AvailableWebcams: {}                            
            I2CBusSpeed: 
%}