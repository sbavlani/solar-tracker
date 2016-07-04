 #include <Servo.h> 
Servo myservo;  // create servo object to control a servo 
int angle=10;   // step angle
int i=0, k=0;
void setup() 
{
  for(i=0;i<10;i++)
  {
    myservo.attach(9);   // attach servo object to pin 9
    myservo.write(90-angle*i);  // clockwise rotation
    delay(1000);          
  }
  for(k=0;k<10;k++)
  {
    myservo.attach(9);     // attach servo object to pin 9
    myservo.write(angle*k);   // anticlockwise rotation
    delay(1000);
  }
 myservo.detach();     
}

void loop() {
  // put your main code here, to run repeatedly:

}
