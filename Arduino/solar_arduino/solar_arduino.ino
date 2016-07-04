#include<Servo.h>
Servo myservo;  // Create servo object to create a servo
int angle=5;   // step angle        
int i;
int j=0;
int p,q,r,s;                
void setup() 
{
Serial.begin(115200);
for(i=1;i<=20;i++)
{
   p=analogRead(A0);  // read analog value of LDR1
   Serial.println(p); 
   q=analogRead(A1);  // read analog value of LDR2
   Serial.println(q);
   myservo.attach(9); // attach servo to pin 9
   r=p-q;
   s=q-p;
   if(p<q && s>50 )
   {
    j=j+1;
    myservo.write((90-angle*j));  // clockwise rotation
    delay(1000);
   }
   if(p>q && r>50)
   {
    j=j-1;
    myservo.write((90-angle*j));  // anticlockwise rotation
    delay(1000);
   }
}
myservo.detach();
}
void loop() {
}
