mypi = raspi('192.168.10.108', 'pi', 'arthur');
writeDigitalPin(mypi, 6, 1);
writeDigitalPin(mypi, 26, 1);
configurePin(mypi, 13, 'PWM');
configurePin(mypi, 20, 'PWM');
configurePin(mypi, 12, 'PWM');
configurePin(mypi, 21, 'PWM');

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