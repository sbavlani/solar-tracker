ok=open_serial(1,2,115200); // Port 2 with baudrate 115200
if ok~=0 then error('Unable to open serial port.  Please check') end
cmd_servo_attach(1,1)        // Attach motor to pin 9. (1 means pin 9).
sleep(1000)
angle=10;                            // Angle by which it has to move
for i=0:9
   cmd_servo_move(1,1,(90-angle*i)) // Servo rotation in clockwise direction
   sleep(1000)                     // Waits for a sec 
end
for k=0:9
    cmd_servo_move(1,1,(angle*k)) // Servo rotation in anticlockwise direction
    sleep(1000)                  // Waits for a second
end
cmd_servo_detach(1,1)          // Detach the motor
close_serial(1);               //To close the connection safely
