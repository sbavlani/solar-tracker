ok=open_serial(1,2,115200);     // At port 2 with baudrate 115200
if ok~=0 then error('Unable to open serial port.  Please check') end
cmd_servo_attach(1,1)          // attach motor to pin 9 (1 means pin 9)
sleep(1000);
j=0;
s=0;
r=0;
cmd_servo_move(1,1,90)         // Rotate by 90 degees
for i=1:20
    p=cmd_analog_in(1,0);   // Read analog value from LDR1
    disp(p);
    q=cmd_analog_in(1,1);  // Read analog value from LDR2
    disp(q);
    s=p-q;                // Setting of threshold for rotation in clockwise direction
    r=q-p;               // Setting of threshold for rotation in anti-clockwise direction
    if (p<q & r>50) then  
        j=j+1;           // Parameter for determing motor postion from inital poistion
        cmd_servo_move(1,1,(90-5*j)) // anticlockwise rotation//
       sleep(500);
   end
   if (p>q & s>50) then
       j=j-1;           // Parameter for determing motor postion from inital poistion
       cmd_servo_move(1,1,(90-5*j)) // clockwise rotation//
       sleep(500);
   end
   sleep(1000);
end
cmd_servo_detach(1,1)    
close_serial(1)
