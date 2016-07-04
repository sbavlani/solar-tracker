ok=open_serial(1,2,115200); // Port 2 with baudrate 115200
if ok~=0 then error('Unable to open serial port.  Please check') end
for i=1:10
    p=cmd_analog_in(1,0);   // Read analog pin 0 (LDR1)
    disp(p);
    q=cmd_analog_in(1,1);   // Read analog pin 1 (LDR2)
    disp(q);
    if (p<q) then 
        cmd_digital_out(1,11,1) // If condition is true red LED will blink
        sleep(500);
        cmd_digital_out(1,11,0)
        sleep(500);
    end
    if(p>q) then                // If condition true green LED will blink
        cmd_digital_out(1,10,1)
        sleep(500);
        cmd_digital_out(1,10,0)
        sleep(500)
    end
end
close_serial(1)          // To close the connection safely
